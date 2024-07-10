import 'dart:async';
import 'dart:typed_data';

import 'package:hd_wallet/hd_wallet.dart';
import 'package:snggle/bloc/generic/list/a_list_cubit.dart';
import 'package:snggle/config/locator.dart';
import 'package:snggle/infra/services/wallets_service.dart';
import 'package:snggle/shared/factories/wallet_model_factory.dart';
import 'package:snggle/shared/models/a_list_item_model.dart';
import 'package:snggle/shared/models/groups/group_model.dart';
import 'package:snggle/shared/models/password_model.dart';
import 'package:snggle/shared/models/vaults/vault_model.dart';
import 'package:snggle/shared/models/vaults/vault_secrets_model.dart';
import 'package:snggle/shared/models/wallets/wallet_creation_request_model.dart';
import 'package:snggle/shared/models/wallets/wallet_model.dart';
import 'package:snggle/shared/models/wallets/wallet_secrets_model.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

class WalletListPageCubit extends AListCubit<WalletModel> {
  final WalletsService _walletsService = globalLocator<WalletsService>();

  final VaultModel vaultModel;
  final PasswordModel vaultPasswordModel;

  WalletListPageCubit({
    required super.depth,
    required super.filesystemPath,
    required this.vaultModel,
    required this.vaultPasswordModel,
  });

  @override
  Future<void> moveItem(AListItemModel item, FilesystemPath newFilesystemPath) async {
    if (item is WalletModel) {
      await _walletsService.move(item, newFilesystemPath);
    } else if (item is GroupModel) {
      GroupModel movedGroupModel = await groupsService.move(item, newFilesystemPath);

      await _walletsService.moveByParentPath(item.filesystemPath, movedGroupModel.filesystemPath);
      await groupsService.moveByParentPath(item.filesystemPath, movedGroupModel.filesystemPath);
    } else {
      throw StateError('List item not supported');
    }
    await refreshAll();
  }

  @override
  Future<void> deleteItem(AListItemModel item) async {
    if (item is WalletModel) {
      await _walletsService.deleteById(item.id);
    } else if (item is GroupModel) {
      await _walletsService.deleteAllByParentPath(item.filesystemPath);
      await groupsService.deleteAllByParentPath(item.filesystemPath);
      await groupsService.deleteById(item.id);
    }

    await refreshAll();
  }

  @override
  Future<List<WalletModel>> fetchAllItems() async {
    List<WalletModel> walletModelList = await _walletsService.getAllByParentPath(state.filesystemPath, firstLevelBool: true);
    return walletModelList;
  }

  @override
  Future<List<GroupModel>> fetchAllGroups() async {
    List<GroupModel> groupModelList = await groupsService.getAllByParentPath(state.filesystemPath, firstLevelBool: true);
    return groupModelList;
  }

  @override
  Future<WalletModel?> fetchSingleItem(WalletModel item) async {
    WalletModel walletModel = await _walletsService.getById(item.id);
    return walletModel;
  }

  @override
  Future<GroupModel?> fetchSingleGroup(GroupModel group) async {
    GroupModel? groupModel = await groupsService.getById(group.id);
    return groupModel;
  }

  @override
  Future<void> saveItem(WalletModel item) async {
    await _walletsService.save(item);
  }

  @override
  Future<void> saveGroup(GroupModel group) async {
    await groupsService.save(group);
  }

  // TODO(dominik): Temporary solution to create new wallet.
  // The process of creating a new wallet will be extracted into a separate page with its own designs.
  Future<void> createNewWallet() async {
    WalletModelFactory walletModelFactory = globalLocator<WalletModelFactory>();
    VaultSecretsModel vaultSecretsModel = await secretsService.get(vaultModel.filesystemPath, vaultPasswordModel);

    // This section is used to determine the next derivation path segment for the new wallet
    // In current demo app, this value is calculated automatically, basing on the last wallet index existing in database
    // In the targeted app this value should be provided (or confirmed) by user an this functionality will be implemented on the next stages
    int lastWalletIndex = await _walletsService.getLastIndex(state.filesystemPath);
    int walletIndex = lastWalletIndex + 1;
    String derivationPath = "m/44'/60'/0'/0/${walletIndex}";

    // Seed calculation also will be changed (moved to the separate class). Currently, for the work organization reasons,
    // app allows to generate only one wallet type and this functionality is mocked here
    Uint8List seed = await vaultSecretsModel.mnemonicModel.calculateSeed();
    BIP32 rootNode = BIP32.fromSeed(seed);
    BIP32 derivedNode = rootNode.derivePath(derivationPath);

    WalletModel walletModel = await walletModelFactory.createNewWallet(
      WalletCreationRequestModel(
        index: walletIndex,
        derivationPath: derivationPath,
        network: 'ethereum',
        publicKey: derivedNode.publicKey,
        parentFilesystemPath: state.filesystemPath,
      ),
    );

    WalletSecretsModel walletSecretsModel = WalletSecretsModel(
      filesystemPath: walletModel.filesystemPath,
      privateKey: derivedNode.privateKey!,
    );

    await _walletsService.save(walletModel);
    await secretsService.save(walletSecretsModel, PasswordModel.defaultPassword());
    await refreshAll();
  }
}

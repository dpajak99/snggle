import 'package:equatable/equatable.dart';
import 'package:snggle/shared/models/wallets/wallet_model.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

class WalletEntity extends Equatable {
  final bool encryptedBool;
  final bool pinnedBool;
  final int index;
  final String address;
  final String derivationPath;
  final String network;
  final int id;
  final FilesystemPath filesystemPath;
  final String? name;

  const WalletEntity({
    required this.encryptedBool,
    required this.pinnedBool,
    required this.index,
    required this.address,
    required this.derivationPath,
    required this.network,
    required this.id,
    required this.filesystemPath,
    this.name,
  });

  factory WalletEntity.fromJson(Map<String, dynamic> json) {
    return WalletEntity(
      encryptedBool: json['encrypted'] as bool,
      pinnedBool: json['pinned'] as bool,
      index: json['index'] as int,
      address: json['address'] as String,
      derivationPath: json['derivation_path'] as String,
      network: json['network'] as String,
      id: json['id'] as int,
      filesystemPath: FilesystemPath.fromString(json['filesystem_path'] as String),
      name: json['name'] as String?,
    );
  }

  factory WalletEntity.fromWalletModel(WalletModel walletModel) {
    return WalletEntity(
      encryptedBool: walletModel.encryptedBool,
      pinnedBool: walletModel.pinnedBool,
      index: walletModel.index,
      address: walletModel.address,
      derivationPath: walletModel.derivationPath,
      network: walletModel.network,
      id: walletModel.id,
      filesystemPath: walletModel.filesystemPath,
      name: walletModel.name,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'encrypted': encryptedBool,
      'pinned': pinnedBool,
      'index': index,
      'address': address,
      'derivation_path': derivationPath,
      'network': network,
      'id': id,
      'filesystem_path': filesystemPath.fullPath,
      'name': name,
    };
  }

  @override
  List<Object?> get props => <Object?>[encryptedBool, pinnedBool, index, address, derivationPath, network, id, filesystemPath, name];
}

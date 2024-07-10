import 'package:snggle/infra/entities/wallet_entity.dart';
import 'package:snggle/infra/managers/database_collection_wrapper.dart';
import 'package:snggle/infra/managers/database_parent_key.dart';
import 'package:snggle/infra/managers/encrypted_database_manager.dart';

class WalletsRepository {
  final EncryptedDatabaseManager _encryptedDatabaseManager = EncryptedDatabaseManager();
  late final DatabaseCollectionWrapper<Map<String, dynamic>> _databaseCollectionWrapper = DatabaseCollectionWrapper<Map<String, dynamic>>(
    databaseManager: _encryptedDatabaseManager,
    databaseParentKey: DatabaseParentKey.wallets,
  );

  Future<List<WalletEntity>> getAll() async {
    List<Map<String, dynamic>> allWalletsJson = await _databaseCollectionWrapper.getAll();
    List<WalletEntity> allWallets = allWalletsJson.map(WalletEntity.fromJson).toList();
    return allWallets;
  }

  Future<WalletEntity> getById(int id) async {
    Map<String, dynamic> walletJson = await _databaseCollectionWrapper.getById(id);
    WalletEntity walletEntity = WalletEntity.fromJson(walletJson);
    return walletEntity;
  }

  Future<void> save(WalletEntity walletEntity) async {
    await _databaseCollectionWrapper.saveWithId(walletEntity.id, walletEntity.toJson());
  }

  Future<void> deleteById(int id) async {
    await _databaseCollectionWrapper.deleteById(id);
  }
}

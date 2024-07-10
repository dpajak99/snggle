import 'dart:async';
import 'package:isar/isar.dart';
import 'package:snggle/config/isar.dart';
import 'package:snggle/infra/entities/vault_entity.dart';
import 'package:snggle/infra/exceptions/child_key_not_found_exception.dart';

class VaultsRepository {
  Future<List<VaultEntity>> getAll() async {
    List<VaultEntity> vaultEntities = await isar.vaults.where().findAll();
    return vaultEntities;
  }

  Future<VaultEntity> getById(int id) async {
    VaultEntity? vaultEntity = await isar.vaults.get(id);
    if (vaultEntity == null) {
      throw ChildKeyNotFoundException();
    }
    return vaultEntity;
  }

  Future<void> save(VaultEntity vaultEntity) async {
    await isar.writeTxn(() async {
      await isar.vaults.put(vaultEntity);
    });
  }

  Future<void> deleteById(int id) async {
    await isar.vaults.delete(id);
  }
}

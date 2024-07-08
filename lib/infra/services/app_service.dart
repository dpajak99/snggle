import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';
import 'package:snggle/config/locator.dart';
import 'package:snggle/infra/managers/isar_database_manager.dart';
import 'package:snggle/infra/services/master_key_service.dart';
import 'package:snggle/shared/models/password_model.dart';
import 'package:snggle/shared/value_objects/master_key_vo.dart';

class AppService {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final RootDirectoryBuilder _rootDirectoryBuilder = globalLocator<RootDirectoryBuilder>();
  final MasterKeyService _masterKeyService = globalLocator<MasterKeyService>();

  Future<bool> isCustomPasswordSet() async {
    bool masterKeyExistsBool = await _masterKeyService.isMasterKeyExists();
    if (masterKeyExistsBool) {
      MasterKeyVO masterKeyVO = await _masterKeyService.getMasterKey();
      return PasswordModel.isEncryptedWithCustomPassword(masterKeyVO.encryptedMasterKey);
    } else {
      return false;
    }
  }

  Future<bool> isPasswordValid(PasswordModel appPasswordModel) async {
    MasterKeyVO masterKeyVO = await _masterKeyService.getMasterKey();
    return appPasswordModel.isValidForData(masterKeyVO.encryptedMasterKey);
  }

  Future<void> wipe() async {
    await _clearSecureStorage();
    await _clearFilesystemStorage();
    await _clearIsarDatabase();
  }

  Future<void> _clearSecureStorage() async {
    await _flutterSecureStorage.deleteAll();
  }

  Future<void> _clearFilesystemStorage() async {
    Directory rootDirectory = await _rootDirectoryBuilder();
    rootDirectory.listSync().forEach((FileSystemEntity e) => e.deleteSync(recursive: true));
  }

  Future<void> _clearIsarDatabase() async {
    await globalLocator<IsarDatabaseManager>().perform((Isar isar) {
      return isar.writeTxn(() => isar.clear());
    });
  }
}

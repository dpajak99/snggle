import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snggle/infra/entities/vault_entity.dart';

late Isar isar;

Future<void> initIsar() async {
  Directory rootDirectory = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    <CollectionSchema<dynamic>>[VaultEntitySchema],
    directory: rootDirectory.path,
  );
}

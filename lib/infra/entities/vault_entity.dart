import 'package:isar/isar.dart';
import 'package:snggle/shared/models/vaults/vault_model.dart';

part 'vault_entity.g.dart';

@Collection(accessor: 'vaults')
class VaultEntity {
  final Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final bool encrypted;

  @Index(type: IndexType.value)
  final bool pinned;

  @Index(type: IndexType.value)
  final int index;

  @Index(type: IndexType.value)
  final String filesystemPathString;

  @Index(type: IndexType.value)
  final String? name;

  const VaultEntity({
    required this.encrypted,
    required this.pinned,
    required this.index,
    required this.filesystemPathString,
    this.name,
  });

  factory VaultEntity.fromVaultModel(VaultModel vaultModel) {
    return VaultEntity(
      encrypted: vaultModel.encryptedBool,
      pinned: vaultModel.pinnedBool,
      index: vaultModel.index,
      filesystemPathString: vaultModel.filesystemPath.fullPath,
      name: vaultModel.name,
    );
  }
}

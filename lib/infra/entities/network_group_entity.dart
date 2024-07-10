import 'package:snggle/infra/entities/group_entity.dart';
import 'package:snggle/shared/models/groups/group_type.dart';
import 'package:snggle/shared/models/groups/network_group_model.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

class NetworkGroupEntity extends GroupEntity {
  final String networkId;

  const NetworkGroupEntity({
    required super.pinnedBool,
    required super.encryptedBool,
    required super.id,
    required super.name,
    required super.filesystemPath,
    required this.networkId,
  });

  factory NetworkGroupEntity.fromJson(Map<String, dynamic> json) {
    return NetworkGroupEntity(
      pinnedBool: json['pinned'] as bool,
      encryptedBool: json['encrypted'] as bool,
      id: json['id'] as int,
      name: json['name'] as String,
      filesystemPath: FilesystemPath.fromString(json['filesystem_path'] as String),
      networkId: json['network_id'] as String,
    );
  }

  factory NetworkGroupEntity.fromGroupModel(NetworkGroupModel networkGroupModel) {
    return NetworkGroupEntity(
      pinnedBool: networkGroupModel.pinnedBool,
      encryptedBool: networkGroupModel.encryptedBool,
      id: networkGroupModel.id,
      name: networkGroupModel.name,
      filesystemPath: networkGroupModel.filesystemPath,
      networkId: networkGroupModel.networkConfigModel.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': GroupType.network.name,
      'pinned': pinnedBool,
      'encrypted': encryptedBool,
      'id': id,
      'name': name,
      'filesystem_path': filesystemPath.fullPath,
      'network_id': networkId,
    };
  }

  @override
  List<Object?> get props => <Object?>[pinnedBool, encryptedBool, id, name, filesystemPath, networkId];
}

import 'package:snggle/shared/models/a_list_item_model.dart';
import 'package:snggle/shared/models/groups/group_type.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

class GroupModel extends AListItemModel {
  final List<AListItemModel> listItemsPreview;
  final String _name;

  GroupModel({
    required super.pinnedBool,
    required super.encryptedBool,
    required super.id,
    required super.filesystemPath,
    required this.listItemsPreview,
    required String name,
  }) : _name = name;

  @override
  GroupModel copyWith({
    bool? pinnedBool,
    bool? encryptedBool,
    int? id,
    List<AListItemModel>? listItemsPreview,
    FilesystemPath? filesystemPath,
    String? name,
  }) {
    return GroupModel(
      pinnedBool: pinnedBool ?? this.pinnedBool,
      encryptedBool: encryptedBool ?? this.encryptedBool,
      id: id ?? this.id,
      listItemsPreview: listItemsPreview ?? this.listItemsPreview,
      filesystemPath: filesystemPath ?? this.filesystemPath,
      name: name ?? this.name,
    );
  }

  @override
  String get name => _name;

  GroupType get groupType => GroupType.group;

  @override
  List<Object?> get props => <Object?>[pinnedBool, encryptedBool, id, listItemsPreview, filesystemPath, name];
}

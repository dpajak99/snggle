import 'package:snggle/shared/models/a_list_item_model.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

class VaultModel extends AListItemModel {
  final int index;
  final List<AListItemModel> listItemsPreview;

  VaultModel({
    required super.encryptedBool,
    required super.pinnedBool,
    required super.id,
    required super.filesystemPath,
    required super.name,
    required this.index,
    required this.listItemsPreview,
  });

  @override
  VaultModel copyWith({
    bool? encryptedBool,
    bool? pinnedBool,
    int? index,
    int? id,
    FilesystemPath? filesystemPath,
    String? name,
    List<AListItemModel>? listItemsPreview,
  }) {
    return VaultModel(
      encryptedBool: encryptedBool ?? this.encryptedBool,
      pinnedBool: pinnedBool ?? this.pinnedBool,
      index: index ?? this.index,
      id: id ?? this.id,
      filesystemPath: filesystemPath ?? this.filesystemPath,
      name: name ?? this.name,
      listItemsPreview: listItemsPreview ?? this.listItemsPreview,
    );
  }

  @override
  String get name {
    return super.name ?? 'Vault $index'.toUpperCase();
  }

  @override
  List<Object?> get props => <Object?>[encryptedBool, pinnedBool, index, id, name, filesystemPath, listItemsPreview];
}

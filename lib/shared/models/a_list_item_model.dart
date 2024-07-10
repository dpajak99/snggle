import 'package:equatable/equatable.dart';
import 'package:snggle/shared/models/groups/group_model.dart';
import 'package:snggle/shared/models/groups/group_type.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

abstract class AListItemModel with EquatableMixin {
  final bool encryptedBool;
  final bool pinnedBool;
  final int id;
  final FilesystemPath filesystemPath;
  final String? _name;

  AListItemModel({
    required this.encryptedBool,
    required this.pinnedBool,
    required this.id,
    required this.filesystemPath,
    String? name,
  }) : _name = name;

  AListItemModel copyWith({bool? encryptedBool, bool? pinnedBool});

  AListItemModel setEncrypted({required bool encryptedBool}) {
    return copyWith(encryptedBool: encryptedBool);
  }

  AListItemModel setPinned({required bool pinnedBool}) {
    return copyWith(pinnedBool: pinnedBool);
  }

  String? get name => _name;

  int compareTo(AListItemModel other) {
    bool currentIsGroupBool = this is GroupModel && (this as GroupModel).groupType == GroupType.group;

    bool typesEqualBool = runtimeType == other.runtimeType;
    bool pinnedEqualBool = pinnedBool == other.pinnedBool;

    if (typesEqualBool && pinnedEqualBool) {
      return name?.compareTo(other.name ?? '') ?? 0;
    } else if (pinnedEqualBool) {
      return currentIsGroupBool ? -1 : 1;
    } else {
      return pinnedBool ? -1 : 1;
    }
  }

  @override
  List<Object?> get props => <Object?>[encryptedBool, pinnedBool, id, filesystemPath];
}

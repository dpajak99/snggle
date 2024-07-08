import 'package:equatable/equatable.dart';

class AppWipeDialogState extends Equatable {
  static const int requiredConfirmationsCount = 3;

  final int confirmationsCount;
  final bool resetInProgressBool;

  const AppWipeDialogState({
    required this.confirmationsCount,
    this.resetInProgressBool = false,
  });

  AppWipeDialogState copyWith({
    int? confirmationsCount,
    bool? resetInProgressBool,
  }) {
    return AppWipeDialogState(
      confirmationsCount: confirmationsCount ?? this.confirmationsCount,
      resetInProgressBool: resetInProgressBool ?? this.resetInProgressBool,
    );
  }

  int get confirmationsLeft => requiredConfirmationsCount - confirmationsCount;

  @override
  List<Object?> get props => <Object>[confirmationsCount];
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChangePasswordState.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default('') String newPassword,
    @Default('') String confirmPassword,
    @Default(null) String? newPasswordError,
    @Default(null) String? confirmPasswordError,
    @Default(false) bool saveSuccess,
    @Default(false) bool isLoading
  }) = _ChangePasswordState;
}
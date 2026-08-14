import 'package:freezed_annotation/freezed_annotation.dart';

import '../../users/data/model/UserModel.dart';

part 'RegisterState.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String name,
    @Default('') String email,
    @Default(null) UserRole? role,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? nameError,
    String? emailError,
    String? roleError,
    String? passwordError,
    String? confirmPasswordError,
    String? generalError,
  }) = _RegisterState;
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginState.freezed.dart';

//enum LoginErrorType { invalidCredentials, generic }


/*
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.error(LoginErrorType type) = LoginError;
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedIn,
    @Default(null) String? errorMessage
  }) = _LoginState;
}
 */

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedIn,
    @Default(null) String? errorMessage
  }) = _LoginState;
}
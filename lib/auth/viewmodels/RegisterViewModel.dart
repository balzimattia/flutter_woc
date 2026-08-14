import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/AuthRepository.dart';
import '../states/RegisterState.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel({AuthRepositoryInterface? authRepository})
      : _authRepository = authRepository ?? AuthRepository.instance;

  final AuthRepositoryInterface _authRepository;

  RegisterState _state = const RegisterState();
  RegisterState get state => _state;

  void _setState(RegisterState newState) {
    _state = newState;
    notifyListeners();
  }

  void onNameChanged(String value) =>
      _setState(_state.copyWith(name: value, nameError: null, generalError: null));

  void onEmailChanged(String value) =>
      _setState(_state.copyWith(email: value, emailError: null, generalError: null));

  void onRoleChanged(UserRole? value) =>
      _setState(_state.copyWith(role: value, roleError: null));

  void onPasswordChanged(String value) =>
      _setState(_state.copyWith(password: value, passwordError: null, generalError: null));

  void onConfirmPasswordChanged(String value) =>
      _setState(_state.copyWith(confirmPassword: value, confirmPasswordError: null));

  RegisterState _validate() {
    final nameError = _state.name.trim().split(RegExp(r'\s+')).length < 2
        ? 'Inserisci nome e cognome'
        : null;

    final emailError = !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_state.email)
        ? 'Email non valida'
        : null;

    final roleError = _state.role == null ? 'Seleziona un ruolo' : null;

    final passwordError = _state.password.length < 8
        ? 'Minimo 8 caratteri'
        : null;

    final confirmPasswordError = _state.password != _state.confirmPassword
        ? 'Le password non coincidono'
        : null;

    return _state.copyWith(
      nameError: nameError,
      emailError: emailError,
      roleError: roleError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }

  Future<void> register() async {
    final validated = _validate();
    _setState(validated);

    final hasErrors = validated.nameError != null ||
        validated.emailError != null ||
        validated.roleError != null ||
        validated.passwordError != null ||
        validated.confirmPasswordError != null;

    if (hasErrors) return;

    _setState(_state.copyWith(isLoading: true, generalError: null));

    try {
      await _authRepository.register(
        _state.email,
        _state.password,
        _state.name.trim(),
        _state.role!,
      );

      _setState(_state.copyWith(isSuccess: true));
    } on AuthException catch (e) {
      switch (e.code) {
        case _AuthErrorCodes.userAlreadyExists:
        case _AuthErrorCodes.emailExists:
          _setState(_state.copyWith(
            emailError: 'Email già in uso',
          ));
        default:
          _setState(_state.copyWith(
            generalError: 'Qualcosa è andato storto',
          ));
      }
    } catch (_) {
      _setState(_state.copyWith(
        generalError: 'Qualcosa è andato storto',
      ));
    } finally {
      _setState(_state.copyWith(isLoading: false));
    }
  }
}



class _AuthErrorCodes {
  _AuthErrorCodes._();
  static const String userAlreadyExists = 'user_already_exists';
  static const String emailExists = 'email_exists';
  static const String invalidCredentials = 'invalid_credentials';
}
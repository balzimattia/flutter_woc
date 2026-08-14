import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/AuthRepository.dart';
import '../states/LoginState.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({AuthRepositoryInterface? authRepository})
      : _authRepository = authRepository ?? AuthRepository.instance;

  final AuthRepositoryInterface _authRepository;

  LoginState _state = const LoginState();
  LoginState get state => _state;

  void _setState(LoginState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> login() async {
    resetError();

    try {
      _setState(_state.copyWith(isLoading: true));

      await _authRepository.login(_state.email, _state.password);

      _setState(_state.copyWith(isLoggedIn: true));
    } on AuthException catch (_) {
      _setState(_state.copyWith(errorMessage: 'Email o password errati'));
    } catch (e) {
      _setState(_state.copyWith(errorMessage: 'Qualcosa è andato storto'));
    } finally {
      _setState(_state.copyWith(isLoading: false));
    }
  }

  void resetError() {
    _setState(_state.copyWith(errorMessage: null));
  }

  void onEmailChanged(String value) => _setState(_state.copyWith(email: value));

  void onPasswordChanged(String value) => _setState(_state.copyWith(password: value));
}
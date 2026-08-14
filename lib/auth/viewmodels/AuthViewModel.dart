import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../users/data/model/UserModel.dart';
import '../data/AuthRepository.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({AuthRepositoryInterface? authRepository})
      : _authRepository = authRepository ?? AuthRepository.instance {
    _authRepository.currentUser.addListener(_onUserChanged);
    _authSub = Supabase.instance.client.auth.onAuthStateChange
        .listen(_onAuthStateChange);
  }

  final AuthRepositoryInterface _authRepository;
  late final StreamSubscription<AuthState> _authSub;

  SessionStatus sessionStatus = SessionStatus.initializing;

  UserModel? get currentUser => _authRepository.currentUser.value;
  bool get isLoggedIn => currentUser != null;

  bool _isLoggingOut = false;
  bool get isLoggingOut => _isLoggingOut;

  void _onUserChanged() => notifyListeners();

  void _onAuthStateChange(AuthState data) {
    final hasSession = data.session != null;

    switch (data.event) {
      case AuthChangeEvent.initialSession:
        sessionStatus = hasSession ? SessionStatus.authenticated : SessionStatus.notAuthenticated;
        break;
      case AuthChangeEvent.signedIn:
      case AuthChangeEvent.tokenRefreshed:
      case AuthChangeEvent.userUpdated:
        sessionStatus = SessionStatus.authenticated;
        break;
      case AuthChangeEvent.signedOut:
        sessionStatus = SessionStatus.notAuthenticated;
        break;
      default:
        break;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggingOut = true;
    notifyListeners();
    try {
      await _authRepository.logout();
    } catch (e) {
      throw Exception('Qualcosa è andato storto');
    } finally {
      _isLoggingOut = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _authRepository.currentUser.removeListener(_onUserChanged);
    _authSub.cancel();
    super.dispose();
  }
}

enum SessionStatus { initializing, authenticated, notAuthenticated }
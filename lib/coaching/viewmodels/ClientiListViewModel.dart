import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_woc/auth/data/AuthRepository.dart';
import 'package:flutter_woc/coaching/data/CoachingRepository.dart';
import 'package:flutter_woc/users/data/UserRepository.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';

class ClientiListViewModel extends ChangeNotifier {
  ClientiListViewModel({
    AuthRepositoryInterface? authRepository,
    CoachUserRepositoryInterface? userRepository,
    CoachingRelationRepositoryInterface? coachingRelationRepository
  }) : _authRepository = authRepository ?? AuthRepository.instance,
    _userRepository = userRepository ?? UserRepository.instance,
    _coachingRelationRepository = coachingRelationRepository ?? CoachingRepository.instance
  {
    retrieveClientiList();
  }

  final AuthRepositoryInterface _authRepository;
  final CoachUserRepositoryInterface _userRepository;
  final CoachingRelationRepositoryInterface _coachingRelationRepository;


  List<UserModel> _clientiList = List.empty();
  List<UserModel> get clientiList => _clientiList;

  bool _isLoadingClientiList = false;
  bool get isLoadingClientiList => _isLoadingClientiList;

  final StreamController<String> _errorMessage = StreamController<String>.broadcast();
  Stream<String> get errorMessage => _errorMessage.stream;


  Future<void> retrieveClientiList() async {
    try {
      _isLoadingClientiList = true; notifyListeners();
      final id = _authRepository.currentUser.value?.id;
      if(id == null) return;

      _clientiList = await _userRepository.getClientiList(id);
    } finally {
      _isLoadingClientiList = false;
      notifyListeners();
    }
  }

  Future<void> removeRelationWithCliente(UserModel cliente) async {
    try {
      _isLoadingClientiList = true; notifyListeners();
      _coachingRelationRepository.removeCoachingRelation(cliente.id);

      final id = _authRepository.currentUser.value?.id;
      if(id == null) return;

      _clientiList = await _userRepository.getClientiList(id);
    } catch (_) {
      if(_clientiList.isEmpty) {
        _errorMessage.add('Impossibile caricare la lista');
      } else {
        _errorMessage.add('Qualcosa è andato storto');
      }
    } finally {
      _isLoadingClientiList = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _errorMessage.close();
    super.dispose();
  }
}
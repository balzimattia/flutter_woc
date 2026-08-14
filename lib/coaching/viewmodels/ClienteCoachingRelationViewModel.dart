import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_woc/coaching/data/CoachingRepository.dart';
import 'package:flutter_woc/coaching/states/OwnCoachState.dart';

import '../../auth/data/AuthRepository.dart';

class ClienteCoachingRelationViewModel extends ChangeNotifier {
  ClienteCoachingRelationViewModel({
    CoachingRelationRepositoryInterface? coachingRepository,
    AuthRepositoryInterface? authRepository,
  })  : _coachingRepository = coachingRepository ?? CoachingRepository.instance,
        _authRepository = authRepository ?? AuthRepository.instance;

  final CoachingRelationRepositoryInterface _coachingRepository;
  final AuthRepositoryInterface _authRepository;


  OwnCoachState _ownCoachState = const OwnCoachState();
  OwnCoachState get ownCoachState => _ownCoachState;

  final StreamController<String> _errorMessage = StreamController<String>.broadcast();
  Stream<String> get errorMessage => _errorMessage.stream;

  void _setState(OwnCoachState newState) {
    _ownCoachState = newState;
    notifyListeners();
  }

  Future<void> getClienteOwnCoach() async {
    final id = _authRepository.currentUser.value?.id;
    if (id == null) return;

    _setState(_ownCoachState.copyWith(isLoading: true, hasLoadingError: false));

    try {
      final coach = await _coachingRepository.getClienteOwnCoach(id);
      _setState(_ownCoachState.copyWith(ownCoach: coach, isLoading: false));
    } catch (_) {
      _setState(_ownCoachState.copyWith(isLoading: false, hasLoadingError: true));
    }
  }

  Future<void> removeCoachingRelation() async {
    final id = _authRepository.currentUser.value?.id;
    if (id == null) return;

    try {
      await _coachingRepository.removeCoachingRelation(id);
      _setState(_ownCoachState.copyWith(ownCoach: null));
    } catch (_) {
      _errorMessage.add('Qualcosa è andato storto');
    }
  }

  @override
  void dispose() {
    _errorMessage.close();
    super.dispose();
  }
}
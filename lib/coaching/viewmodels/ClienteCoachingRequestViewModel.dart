import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_woc/auth/data/AuthRepository.dart';
import 'package:flutter_woc/coaching/data/CoachingRepository.dart';
import 'package:flutter_woc/coaching/data/models/CoachingRequest.dart';

class ClienteCoachingRequestViewModel extends ChangeNotifier {
  ClienteCoachingRequestViewModel(
      {CoachingRequestRepositoryInterface? coachingRequestRepository, AuthRepositoryInterface? authRepository})
      : _coachingRequestRepository = coachingRequestRepository ??
      CoachingRepository.instance,
        _authRepository = authRepository ?? AuthRepository.instance;

  final CoachingRequestRepositoryInterface _coachingRequestRepository;
  final AuthRepositoryInterface _authRepository;


  RequestStatus? _requestStatus;
  RequestStatus? get requestStatus => _requestStatus;

  bool _isLoadingRequestStatus = false;
  bool get isLoadingRequestStatus => _isLoadingRequestStatus;

  final StreamController<String> _requestErrorMessage = StreamController<String>.broadcast();
  Stream<String> get requestErrorMessage => _requestErrorMessage.stream;


  Future<void> addRequest(String coachId) async {
    try {
      await _coachingRequestRepository.addRequest(coachId);
    } catch(_) {
      _requestErrorMessage.add('Qualcosa è andato storto');
    }
  }

  Future<void> getPendingRequest() async {
    try {
      _isLoadingRequestStatus = true;
      notifyListeners();

      final id = _authRepository.currentUser.value?.id;
      if(id == null) return;
      final status = await _coachingRequestRepository.getClientePendingRequest(id);
      _requestStatus = status;
    } catch(_) {
      _requestStatus = null;
    } finally {
      _isLoadingRequestStatus = false;
      notifyListeners();
    }
  }

  Future<void> deletePendingRequest() async {
    try {
      await _coachingRequestRepository.deletePendingRequest();
      await getPendingRequest();
    } catch(_) { }
  }


  @override
  void dispose() {
    _requestErrorMessage.close();
    super.dispose();
  }
}
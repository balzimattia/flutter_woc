import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_woc/coaching/data/CoachingRepository.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';

class CoachCoachingRequestViewModel extends ChangeNotifier {
  CoachCoachingRequestViewModel(
      {CoachingRequestRepositoryInterface? coachingRequestRepository})
      : _coachingRequestRepository = coachingRequestRepository ??
      CoachingRepository.instance {
    retrieveCoachingRequestsList();
  }

  final CoachingRequestRepositoryInterface _coachingRequestRepository;

  List<UserModel> _coachingRequestsList = List.empty();
  List<UserModel> get coachingRequestsList => _coachingRequestsList;

  bool _isLoadingRequestsList = false;
  bool get isLoadinRequestsList => _isLoadingRequestsList;

  final StreamController<String> _errorMessage = StreamController<String>.broadcast();
  Stream<String> get errorMessage => _errorMessage.stream;


  Future<void> retrieveCoachingRequestsList() async {
    try {
      _isLoadingRequestsList = true;
      notifyListeners();

      final list = await _coachingRequestRepository.retrieveRequestsList();
      _coachingRequestsList = list;
    } catch(_) {
      _coachingRequestsList = List.empty();
    } finally {
      _isLoadingRequestsList = false;
      notifyListeners();
    }
  }


  Future<void> updateRequest(bool isAccepted, String clienteId) async {
    try {
      await _coachingRequestRepository.updateRequest(isAccepted, clienteId);
      await retrieveCoachingRequestsList();
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
import 'package:flutter/foundation.dart';
import '../data/ProgramsRepository.dart';
import '../data/models/ProgramSheet.dart';

class CoachProgramViewModel extends ChangeNotifier {
  CoachProgramViewModel({CoachProgramsRepositoryInterface? programsRepository})
      : _programsRepository = programsRepository ?? ProgramsRepository.instance;

  final CoachProgramsRepositoryInterface _programsRepository;

  List<ProgramSheet> _clienteProgramsList = [];
  List<ProgramSheet> get clienteProgramsList => _clienteProgramsList;

  bool _isLoadingInfo = false;
  bool get isLoadingInfo => _isLoadingInfo;

  bool _initialized = false;

  Future<void> getClienteProgramsList(String clienteId, {bool refresh = false}) async {
    if (_initialized && !refresh) return;
    _initialized = true;

    _isLoadingInfo = true;
    notifyListeners();

    try {
      final list = await _programsRepository.getProgramsList(clienteId);
      _clienteProgramsList = list;
    } catch (_) {
      _clienteProgramsList = [];
    } finally {
      _isLoadingInfo = false;
      notifyListeners();
    }
  }
}
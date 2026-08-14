import 'package:flutter/foundation.dart';
import 'package:flutter_woc/users/data/UserRepository.dart';

import '../states/SearchCoachState.dart';

class SearchCoachViewModel extends ChangeNotifier {
  SearchCoachViewModel({ClienteUserRepositoryInterface? userRepository})
      : _userRepository = userRepository ?? UserRepository.instance;

  final ClienteUserRepositoryInterface _userRepository;


  SearchCoachState _searchCoachState = const SearchCoachState();
  SearchCoachState get searchCoachState => _searchCoachState;


  void _setState(SearchCoachState newState) {
    _searchCoachState = newState;
    notifyListeners();
  }


  void onSearchChange(String value) =>
      _setState(_searchCoachState.copyWith(search: value));


  Future<void> searchCoaches() async {
    _setState(_searchCoachState.copyWith(isLoading: true));
    try {
      final search = _searchCoachState.search;
      final coaches = await _userRepository.searchCoachesList(search);
      _setState(_searchCoachState.copyWith(coachesList: coaches, isLoading: false, errorMessage: null));
    } catch (_) {
      _setState(_searchCoachState.copyWith(isLoading: false, errorMessage: 'Coach non trovato'));
    }
  }
}
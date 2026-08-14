import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/model/UserModel.dart';

part 'SearchCoachState.freezed.dart';

@freezed
class SearchCoachState with _$SearchCoachState {
  const factory SearchCoachState({
    @Default('') String search,
    @Default([]) List<UserModel> coachesList,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage
  }) = _SearchCoachState;
}
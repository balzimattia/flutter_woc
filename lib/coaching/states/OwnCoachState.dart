import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'OwnCoachState.freezed.dart';

@freezed
class OwnCoachState with _$OwnCoachState {
  const factory OwnCoachState({
    UserModel? ownCoach,
    @Default(false) bool isLoading,
    @Default(false) bool hasLoadingError,
  }) = _OwnCoachState;
}
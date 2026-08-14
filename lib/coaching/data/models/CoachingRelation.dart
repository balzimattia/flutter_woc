import 'package:freezed_annotation/freezed_annotation.dart';

part 'CoachingRelation.freezed.dart';
part 'CoachingRelation.g.dart';

@freezed
class CoachingRelation with _$CoachingRelation {
  const factory CoachingRelation({
    required String coachId,
    required String clienteId
  }) = _CoachingRelation;

  factory CoachingRelation.fromJson(Map<String, dynamic> json) =>
      _$CoachingRelationFromJson(json);
}
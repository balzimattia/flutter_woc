import 'package:freezed_annotation/freezed_annotation.dart';

part 'CoachingRequest.freezed.dart';
part 'CoachingRequest.g.dart';

@freezed
class CoachingRequest with _$CoachingRequest {
  const factory CoachingRequest({
    required String coachId,
    required String clienteId,
    required RequestStatus status
  }) = _CoachingRequest;

  factory CoachingRequest.fromJson(Map<String, dynamic> json) =>
      _$CoachingRequestFromJson(json);
}

enum RequestStatus {
  @JsonValue('Pending')
  pending('Pending'),

  @JsonValue('Accepted')
  accepted('Accepted'),

  @JsonValue('Rejected')
  rejected('Rejected');

  final String toStatusString;

  const RequestStatus(this.toStatusString);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoachingRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoachingRequestImpl _$$CoachingRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CoachingRequestImpl(
  coachId: json['coachId'] as String,
  clienteId: json['clienteId'] as String,
  status: $enumDecode(_$RequestStatusEnumMap, json['status']),
);

Map<String, dynamic> _$$CoachingRequestImplToJson(
  _$CoachingRequestImpl instance,
) => <String, dynamic>{
  'coachId': instance.coachId,
  'clienteId': instance.clienteId,
  'status': _$RequestStatusEnumMap[instance.status]!,
};

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'Pending',
  RequestStatus.accepted: 'Accepted',
  RequestStatus.rejected: 'Rejected',
};

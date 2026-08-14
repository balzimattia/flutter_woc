// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelImpl(
  userId: json['userId'] as String,
  type: json['type'] as String,
  isAccepted: json['isAccepted'] as bool?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$NotificationModelImplToJson(
  _$NotificationModelImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'type': instance.type,
  'isAccepted': instance.isAccepted,
  'createdAt': instance.createdAt.toIso8601String(),
};

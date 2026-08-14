// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsersDevicesToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersDevicesTokenImpl _$$UsersDevicesTokenImplFromJson(
  Map<String, dynamic> json,
) => _$UsersDevicesTokenImpl(
  userId: json['userId'] as String,
  deviceId: json['deviceId'] as String,
  fcmToken: json['fcmToken'] as String?,
);

Map<String, dynamic> _$$UsersDevicesTokenImplToJson(
  _$UsersDevicesTokenImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'deviceId': instance.deviceId,
  'fcmToken': instance.fcmToken,
};

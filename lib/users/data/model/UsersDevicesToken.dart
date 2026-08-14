import 'package:freezed_annotation/freezed_annotation.dart';

part 'UsersDevicesToken.freezed.dart';
part 'UsersDevicesToken.g.dart';

@freezed
class UsersDevicesToken with _$UsersDevicesToken {
  const factory UsersDevicesToken({
    required String userId,
    required String deviceId,
    required String? fcmToken
  }) = _UsersDevicesToken;

  factory UsersDevicesToken.fromJson(Map<String, dynamic> json) =>
      _$UsersDevicesTokenFromJson(json);
}
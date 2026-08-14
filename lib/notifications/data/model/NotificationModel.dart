import 'package:freezed_annotation/freezed_annotation.dart';
import '../../NotificationType.dart';

part 'NotificationModel.freezed.dart';
part 'NotificationModel.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required String userId,
    required String type,
    required bool? isAccepted,
    required DateTime createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationType get notificationType => NotificationType.fromString(type);
}
import 'package:flutter_woc/notifications/data/model/NotificationModel.dart';
import 'package:flutter_woc/supabase/Tables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class NotificationsRepositoryInterface {
  Future<List<NotificationModel>> getNotifications();
  Future<void> deleteAllNotifications();
}


class NotificationsRepository implements NotificationsRepositoryInterface {
  NotificationsRepository._();
  static final NotificationsRepository instance = NotificationsRepository._();

  final SupabaseClient _supabase = Supabase.instance.client;


  @override
  Future<void> deleteAllNotifications() async {
    final String? userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    final table = Tables.notifications;
    await _supabase.from(table.tableName).delete().eq(table.userId, userId);
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final String? userId = _supabase.auth.currentUser?.id;
    if (userId == null) return List.empty();

    final table = Tables.notifications;
    final response = await _supabase.from(table.tableName).select().eq(table.userId, userId);
    return response.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize() {
    return Supabase.initialize(
      url: 'https://tunfngmgyczbsiivzynk.supabase.co',
      publishableKey: 'sb_publishable_s9g8EqpZ5ayr98lJFZivRQ_IcVslvnl',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
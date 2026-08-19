import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woc/WOCApp.dart';
import 'package:flutter_woc/notifications/MessagingService.dart';
import 'package:flutter_woc/supabase/SupabaseClient.dart';
import 'package:flutter_woc/users/data/SettingsPreferencesStore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SupabaseService.initialize();
  await SettingsPreferencesStore.instance.load();

  runApp(const WOCApp());

  WidgetsBinding.instance.addPostFrameCallback((_) {
    MessagingService.instance.initFCM();
  });
}
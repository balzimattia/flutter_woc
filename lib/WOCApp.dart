import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woc/notifications/NotificationViewModel.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/ui/ThemeController.dart';
import 'package:provider/provider.dart';
import 'NetworkObserver.dart';
import 'auth/viewmodels/AuthViewModel.dart';
import 'navigation/Router.dart';

class WOCApp extends StatelessWidget {
  const WOCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => NetworkObserver()),
        ChangeNotifierProvider(create: (_) => NotificationViewModel())
      ],
      child: _Splash(
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: ThemeController.instance.themeMode,
          builder: (context, mode, _) => MaterialApp.router(
            title: 'WOC',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: mode,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}


class _UserNotificationsBridge extends StatefulWidget {
  const _UserNotificationsBridge({required this.child});
  final Widget child;

  @override
  State<_UserNotificationsBridge> createState() => _UserNotificationsBridgeState();
}

class _UserNotificationsBridgeState extends State<_UserNotificationsBridge> {
  String? _lastUserId;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthViewModel>().currentUser;
    final notificationVm = context.read<NotificationViewModel>();

    if (currentUser?.id != _lastUserId) {
      _lastUserId = currentUser?.id;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (currentUser != null) {
          notificationVm.loadNotifications();
        } else {
          notificationVm.clearNotifications();
        }
      });
    }

    return widget.child;
  }
}


class _Splash extends StatefulWidget {
  final Widget child;
  const _Splash({super.key, required this.child});

  @override
  State<_Splash> createState() => _SplashState();
}

class _SplashState extends State<_Splash> {
  bool _removed = false;

  bool _shouldKeepOnScreen(AuthViewModel auth, NetworkObserver network) {
    if (network.status == ConnectivityStatus.checking) return true;
    if (!network.isConnected) return false;

    switch (auth.sessionStatus) {
      case SessionStatus.initializing:
        return true;
      case SessionStatus.authenticated:
        return auth.currentUser == null;
      case SessionStatus.notAuthenticated:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();
    final network = context.watch<NetworkObserver>();

    if (!_shouldKeepOnScreen(auth, network) && !_removed) {
      _removed = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FlutterNativeSplash.remove();
      });
    }

    return widget.child;
  }
}
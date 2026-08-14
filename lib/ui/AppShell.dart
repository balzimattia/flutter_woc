import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woc/navigation/Router.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../NetworkObserver.dart';
import '../auth/viewmodels/AuthViewModel.dart';
import '../navigation/Routes.dart';
import '../notifications/NotificationViewModel.dart';
import 'components/TopAppBar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  String? _lastUserId;

  @override
  Widget build(BuildContext context) {
    final unselectedColorFilter = ColorFilter.mode(
      Theme.of(context).colorScheme.onSurface,
      BlendMode.srcIn,
    );
    const selectedColorFilter = ColorFilter.mode(AppTheme.lightGreen, BlendMode.srcIn);

    final authViewModel = context.watch<AuthViewModel>();
    final isLoggedIn = authViewModel.isLoggedIn;
    final networkStatus = context.watch<NetworkObserver>().status;
    final notificationViewModel = context.watch<NotificationViewModel>();
    final hasNotifications = notificationViewModel.notifications.isNotEmpty;
    final isLoadingUser = authViewModel.sessionStatus == SessionStatus.authenticated &&
        authViewModel.currentUser == null;


    final currentUserId = authViewModel.currentUser?.id;
    if (currentUserId != _lastUserId) {
      _lastUserId = currentUserId;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (currentUserId != null) {
          notificationViewModel.loadNotifications();
        } else {
          notificationViewModel.clearNotifications();
        }
      });
    }

    final currentRouteName = GoRouterState.of(context).topRoute?.name;
    final isRoot = AppRoutes.rootScreensNames.contains(currentRouteName);
    final onlyTopBar = AppRoutes.onlyTopBarNames.contains(currentRouteName);
    final currentIcon = isRoot ? _getIcon(currentRouteName) : null;
    final isAuthRoute = currentRouteName == AppRoutes.loginName || currentRouteName == AppRoutes.registerName;

    return Scaffold(
      appBar: isLoggedIn && !isAuthRoute
          ? WocAppBar(showBackButton: !isRoot, hasNotifications: hasNotifications)
          : null,
      body: Stack(
        children: [
          widget.child,
          if (networkStatus != ConnectivityStatus.connected)
            Positioned.fill(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: switch (networkStatus) {
                  ConnectivityStatus.checking => const Center(child: CircularProgressIndicator()),
                  ConnectivityStatus.disconnected => const NoWifiContent(),
                  ConnectivityStatus.connected => const SizedBox.shrink(),
                },
              ),
            ),
          if (isLoadingUser)
            Positioned.fill(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
      bottomNavigationBar: (isLoggedIn && !onlyTopBar && !isAuthRoute)
          ? ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          onDestinationSelected: (index) =>
              _onIconSelected(context, _AppIcon.values[index], authViewModel.currentUser),
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: _AppIcon.values.map((icon) {
            final isSelected = icon == currentIcon;
            return NavigationDestination(
              icon: SvgPicture.asset(
                icon.asset,
                colorFilter: isSelected ? selectedColorFilter : unselectedColorFilter,
                height: icon.size,
                width: icon.size,
              ),
              label: '',
            );
          }).toList(),
        ),
      )
          : null,
    );
  }

  _AppIcon? _getIcon(String? routeName) {
    if (routeName == AppRoutes.homeName) return _AppIcon.home;
    if (routeName == AppRoutes.programsName || routeName == AppRoutes.coachClientiListName) return _AppIcon.programs;
    if (routeName == AppRoutes.userName) return _AppIcon.user;
    return null;
  }

  void _onIconSelected(BuildContext context, _AppIcon icon, UserModel? user) {
    switch (icon) {
      case _AppIcon.home:
        context.navigateToHome();
      case _AppIcon.programs:
        if (user?.role == UserRole.coach) {
          context.navigateToClientiList();
        } else if (user?.role == UserRole.cliente) {
          context.navigateToPrograms();
        }
      case _AppIcon.user:
        context.navigateToUser();
    }
  }
}


class NoWifiContent extends StatelessWidget {
  const NoWifiContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off, size: 48, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(height: 8),
          Text(
            'Connessione assente',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}


enum _AppIcon {
  home('assets/icons/home.svg', 30),
  programs('assets/icons/programs.svg', 35),
  user('assets/icons/user.svg', 30);

  const _AppIcon(this.asset, this.size);

  final String asset;
  final double size;
}
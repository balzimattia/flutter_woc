import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woc/navigation/Routes.dart';
import 'package:flutter_woc/ui/components/BackButtonComp.dart';
import 'package:go_router/go_router.dart';

import '../AppTheme.dart';

class WocAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WocAppBar({
    super.key,
    this.onBellTap,
    required this.showBackButton,
    required this.hasNotifications,
    this.isNotificationsSelected = false,
  });

  final VoidCallback? onBellTap;
  final bool showBackButton;
  final bool hasNotifications;
  final bool isNotificationsSelected;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final unselectedColorFilter = ColorFilter.mode(
      Theme.of(context).colorScheme.onSurface,
      BlendMode.srcIn,
    );
    const selectedColorFilter = ColorFilter.mode(AppTheme.lightGreen, BlendMode.srcIn);

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      leading: showBackButton ? const BackButtonComp() : null,
      title: Text(
        'WOC',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  'assets/icons/notifications_bell.svg',
                  colorFilter: isNotificationsSelected ? selectedColorFilter : unselectedColorFilter,
                  height: 30,
                  width: 30,
                ),
                if (hasNotifications)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: onBellTap ?? () => context.pushNamed(AppRoutes.notificationsName),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BackButtonComp extends StatefulWidget {
  const BackButtonComp({super.key});

  @override
  State<BackButtonComp> createState() => _BackButtonCompState();
}

class _BackButtonCompState extends State<BackButtonComp> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/arrow_left.svg',
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
        height: 30,
        width: 30,
      ),
      onPressed: () => context.pop(),
    );
  }
}
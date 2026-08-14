import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/AppTheme.dart';

class ElevatedCardComp extends StatelessWidget {
  const ElevatedCardComp({
    super.key,
    required this.children,
    this.onClick,
    this.onLongPress,
    this.isSelected = false,
    this.padding = const EdgeInsets.all(16),
  });

  final List<Widget> children;
  final VoidCallback? onClick;
  final VoidCallback? onLongPress;
  final bool isSelected;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Card(
          color: Theme.of(context).colorScheme.surface,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected
                ? BorderSide(
              color: AppTheme.greenAcceso,
              width: 2,
            )
                : BorderSide.none,
          ),
          child: InkWell(
            onTap: onClick,
            onLongPress: onLongPress,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:portfolio/features/navigation/presentation/providers/navigation_providers.dart';

class LeftNavigationItemTile extends ConsumerWidget {
  const LeftNavigationItemTile({
    super.key,
    required this.item,
  });
  final LeftNavigationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedScale(
      duration: .25.seconds,
      curve: Curves.easeInOut,
      scale: item.isSelected ? 1 : .8,
      child: AnimatedOpacity(
        duration: .25.seconds,
        curve: Curves.easeInOut,
        opacity: item.isSelected ? 1 : .25,
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: IconButton(
            tooltip: item.label,
            iconSize: 30,
            onPressed: () {
              ref
                  .read(navigationItemsViewModelProvider.notifier)
                  .selectNavItem(item);
            },
            icon: Icon(
              item.icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

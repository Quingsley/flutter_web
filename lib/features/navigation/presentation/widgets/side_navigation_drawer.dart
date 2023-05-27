import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:portfolio/features/navigation/presentation/widgets/side_naviagtion_drawer_row.dart';

class SideNavigationDrawer extends ConsumerWidget {
  const SideNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navItems = ref.watch(navigationItemsViewModelProvider);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          children: List.generate(
            navItems.length,
            (index) => SideNvigationDrawerRow(
              item: navItems[index],
            ),
          )
              .animate(interval: 100.ms)
              .slideX(
                begin: -.5,
                end: 0,
                duration: .5.seconds,
                curve: Curves.easeInOut,
              )
              .fadeIn(
                duration: .5.seconds,
                curve: Curves.easeInOut,
              ),
        ),
      ),
    );
  }
}

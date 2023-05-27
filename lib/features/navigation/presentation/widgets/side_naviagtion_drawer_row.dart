import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:portfolio/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:portfolio/helpers/utils.dart';
import 'package:portfolio/styles/colors.dart';
import 'package:portfolio/styles/styles.dart';

class SideNvigationDrawerRow extends ConsumerWidget {
  const SideNvigationDrawerRow({
    required this.item,
    super.key,
  });
  final LeftNavigationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var labelIconColor =
        PersonalPortfolioColors.pageColor[item.route]!.colors[1];
    var btnColor = PersonalPortfolioColors.pageColor[item.route]!.colors[0]
        .withOpacity(.25);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {
          ref
              .read(navigationItemsViewModelProvider.notifier)
              .selectNavItem(item);
          Utils.mainScaffold.currentState!.closeDrawer();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: btnColor,
          shadowColor: Colors.transparent,
          backgroundColor: item.isSelected ? btnColor : Colors.transparent,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: labelIconColor,
              ),
              PersonalPortfolioStyles.smallHGap,
              Text(
                item.label,
                style: TextStyle(
                  fontWeight:
                      item.isSelected ? FontWeight.bold : FontWeight.normal,
                  color: labelIconColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

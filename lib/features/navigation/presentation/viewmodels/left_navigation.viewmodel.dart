import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:portfolio/helpers/utils.dart';
import 'package:portfolio/shared/providers/shared_providers.dart';
import 'package:portfolio/styles/colors.dart';

class LeftNavigationViewModel extends StateNotifier<List<LeftNavigationItem>> {
  final Ref ref;
  LeftNavigationViewModel(List<LeftNavigationItem> items, this.ref)
      : super([]) {
    state = items;
    // var item = state.first;
    // selectNavItem(item);
  }
  void init() {
    var selectedNaveRoute = ref.read(webLocalStorageProvider).getSelectedNav();
    if (selectedNaveRoute.isNotEmpty) {
      var item = state.where((i) => i.route == selectedNaveRoute).first;
      selectNavItem(item);
    } else {
      selectNavItem(state.first);
    }
  }

  void selectNavItem(LeftNavigationItem item) {
    if (item.route.isNotEmpty) {
      GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    }
    ref.read(pageColorProvider.notifier).state =
        PersonalPortfolioColors.pageColor[item.route]!;

    ref.read(bgPageRouteProvider.notifier).state = item.route;
    ref.read(webLocalStorageProvider).storeSelectedNav(item.route);
    state = [
      for (var element in state) element.copyWith(isSelected: item == element)
    ];
  }
}

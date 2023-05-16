import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:portfolio/features/navigation/data/repositories/inavigation.repository.dart';
import 'package:portfolio/features/navigation/data/repositories/mock_navigation.repository.dart';
import 'package:portfolio/features/navigation/presentation/viewmodels/left_navigation.viewmodel.dart';

final navigationRepositoryProvider =
    Provider<INavigationRepository>((ref) => MockNavigationRepository());

final navigationItemsProvider = Provider<List<LeftNavigationItem>>(
    (ref) => ref.read(navigationRepositoryProvider).getDefaultNavItems());

final navigationItemsViewModelProvider =
    StateNotifierProvider<LeftNavigationViewModel, List<LeftNavigationItem>>(
        (ref) {
  var items = ref.read(navigationItemsProvider);
  return LeftNavigationViewModel(items, ref);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/splash/presentation/viewmodels/splash_page.viewmodel.dart';

final splashPageViewModelProvider = Provider((ref) {
  return SplashPageViewModel(ref);
});

final splashPageFutureProvider = FutureProvider.autoDispose<bool>((ref) {
  var splashVM = ref.read(splashPageViewModelProvider);
  return splashVM.preloadPgaes();
});

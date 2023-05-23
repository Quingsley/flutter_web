import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/data/repositories/iwelcome.repository.dart';
import 'package:portfolio/features/welcome/data/repositories/welcome.repository.dart';
import 'package:portfolio/features/welcome/presentation/viewmodels/greetings_label.viemodel.dart';
import 'package:portfolio/features/welcome/presentation/viewmodels/welcome.viewmodel.dart';

final welcomeRepositoryProvider = Provider<IwelcomeRepository>(
    (ref) => WelcomeRepository(ref) /*MockWelcomeRepository()*/);

final welcomeViewModelProvider = Provider<WelcomePageViewModel>((ref) {
  var repository = ref.read(welcomeRepositoryProvider);
  return WelcomePageViewModel(ref, repository);
});

final welcomeProvider = FutureProvider.autoDispose((ref) {
  final welcomeVM = ref.read(welcomeViewModelProvider);
  return welcomeVM.getWelcomePageData();
});

final greetingsRawListProvider = StateProvider<List<String>>((ref) => []);

final greetingsViewModelProvider =
    StateNotifierProvider<GreetingsViewModel, String>((ref) {
  var greetings = ref.watch(greetingsRawListProvider);
  return GreetingsViewModel(greetings.first, greetings);
});

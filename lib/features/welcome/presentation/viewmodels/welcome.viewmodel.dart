import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:portfolio/features/welcome/data/repositories/iwelcome.repository.dart';
import 'package:portfolio/features/welcome/presentation/providers/welcome_page.providers.dart';

class WelcomePageViewModel {
  final Ref ref;
  final IwelcomeRepository welcomeRepository;

  WelcomePageViewModel(this.ref, this.welcomeRepository);
  Future<WelcomePageModel> getWelcomePageData() async {
    var welcomePageData = await welcomeRepository.getWelcomePageData();
    ref.read(greetingsRawListProvider.notifier).state =
        welcomePageData.greetings;
    return welcomePageData;
  }
}

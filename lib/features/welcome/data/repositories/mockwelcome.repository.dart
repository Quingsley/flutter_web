import 'package:portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:portfolio/features/welcome/data/repositories/iwelcome.repository.dart';

class MockWelcomeRepository implements IwelcomeRepository {
  @override
  Future<WelcomePageModel> getWelcomePageData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return WelcomePageModel(
        title: 'Full Stack Developer',
        subTitle: 'Flutter Developer',
        imgPath: 'https://avatars.githubusercontent.com/u/74877189?v=4',
        greetings: ["hello", "hola", "bonjour", "ciao"],
        name: 'Jerome',
      );
    });
    // return Future.error('Error retrieving the welcome page data');
  }
}

import 'package:portfolio/features/welcome/data/models/welcome_page.model.dart';

abstract class IwelcomeRepository {
  Future<WelcomePageModel> getWelcomePageData();
}

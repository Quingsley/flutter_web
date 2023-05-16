import 'package:portfolio/features/twitter/data/models/twitter_page.model.dart';

abstract class ITwitterRepository {
  Future<TwitterPageModel> getTwitterData();
}

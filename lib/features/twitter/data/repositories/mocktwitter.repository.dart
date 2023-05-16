import 'package:portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:portfolio/features/twitter/data/repositories/itwitter.repository.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class MockTwitterRepository implements ITwitterRepository {
  @override
  Future<TwitterPageModel> getTwitterData() {
    return Future.delayed(
        const Duration(seconds: 2),
        () => TwitterPageModel(
              icon: PersonalPortfolioIcons.twitter,
              title: 'Follow me',
              subtitle: 'on Twitter',
              handle: '@juma_jerome',
              url: 'https://twitter.com/juma_jerome',
            ));
  }
}

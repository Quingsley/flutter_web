import 'package:portfolio/features/github/presentation/pages/github.page.dart';
import 'package:portfolio/features/linkedin/presentation/pages/linkedin.page.dart';
import 'package:portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:portfolio/features/navigation/data/repositories/inavigation.repository.dart';
import 'package:portfolio/features/twitter/presentation/pages/twitter.page.dart';
import 'package:portfolio/features/web/presentation/pages/web.page.dart';
import 'package:portfolio/features/welcome/presentation/pages/welcome.page.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class MockNavigationRepository extends INavigationRepository {
  @override
  List<LeftNavigationItem> getDefaultNavItems() {
    return [
      LeftNavigationItem(
        icon: PersonalPortfolioIcons.user,
        label: 'My Profile',
        route: WelcomePage.route,
        isSelected: true,
      ),
      LeftNavigationItem(
        icon: PersonalPortfolioIcons.twitter,
        label: 'Twitter',
        route: TwitterPage.route,
        isSelected: false,
      ),
      LeftNavigationItem(
        icon: PersonalPortfolioIcons.linkedin,
        label: 'LinkedIn',
        route: LinkedInPage.route,
        isSelected: false,
      ),
      LeftNavigationItem(
        icon: PersonalPortfolioIcons.web,
        label: 'Web',
        route: WebPage.route,
        isSelected: false,
      ),
      LeftNavigationItem(
        icon: PersonalPortfolioIcons.github,
        label: 'GitHub',
        route: GithubPage.route,
        isSelected: false,
      ),
    ];
  }
}

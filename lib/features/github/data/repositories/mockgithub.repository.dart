import 'package:portfolio/features/github/data/models/github.model.dart';
import 'package:portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class MockGithubRepository implements IGithubRepository {
  @override
  Future<GithubPageModel> getGithubData() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => GithubPageModel(
        title: 'Check out',
        subTitle: 'My Repos',
        handle: 'on Github',
        icon: PersonalPortfolioIcons.github,
        url: 'https://github.com/Quingsley',
      ),
    );
  }
}

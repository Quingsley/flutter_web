import 'package:portfolio/features/web/data/models/web.model.dart';
import 'package:portfolio/features/web/data/repositories/iweb.repository.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class MockWebRepository implements IWebRepository {
  @override
  Future<WebPageModel> getWebData() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => WebPageModel(
        title: 'Visit',
        subTitle: 'My Web Page!',
        url: '',
        handle: 'jerome.io',
        icon: PersonalPortfolioIcons.web,
      ),
    );
  }
}

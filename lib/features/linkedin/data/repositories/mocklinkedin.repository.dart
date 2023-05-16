import 'package:portfolio/features/linkedin/data/models/linkedin_page.model.dart';
import 'package:portfolio/features/linkedin/data/repositories/ilinkedin.repository.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class MockLinkedInRepository implements ILinkedInRepository {
  @override
  Future<LinkedInPageModel> getLinkedInUser() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => LinkedInPageModel(
        icon: PersonalPortfolioIcons.linkedin,
        title: "Let's",
        subtitle: "Connect",
        handle: "on LinkedIn",
        url: "https://www.linkedin.com/in/jerome-jumah/",
      ),
    );
  }
}

import 'package:portfolio/features/linkedin/data/models/linkedin_page.model.dart';

abstract class ILinkedInRepository {
  Future<LinkedInPageModel> getLinkedInUser();
}

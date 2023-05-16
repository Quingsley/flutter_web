import 'package:portfolio/features/linkedin/data/models/linkedin_page.model.dart';
import 'package:portfolio/features/linkedin/data/repositories/ilinkedin.repository.dart';

class LinkedInViewModel {
  final ILinkedInRepository linkedInRepository;
  LinkedInViewModel(this.linkedInRepository);

  Future<LinkedInPageModel> getLinkedInData() async {
    return linkedInRepository.getLinkedInUser();
  }
}

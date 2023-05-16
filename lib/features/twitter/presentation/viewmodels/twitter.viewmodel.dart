import 'package:portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:portfolio/features/twitter/data/repositories/itwitter.repository.dart';

class TwitterViewModel {
  final ITwitterRepository twitterRepository;

  TwitterViewModel(
    this.twitterRepository,
  );

  Future<TwitterPageModel> getTwiterData() async {
    return twitterRepository.getTwitterData();
  }
}

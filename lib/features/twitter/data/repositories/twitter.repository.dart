import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:portfolio/features/twitter/data/repositories/itwitter.repository.dart';
import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/providers/shared_providers.dart';

class TwitterRepository extends ITwitterRepository {
  final Ref ref;
  TwitterRepository(this.ref);
  @override
  Future<TwitterPageModel> getTwitterData() {
    return ref.read(dbProvider).getPageDataFromDB(
          TwitterPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.twitterPage.name,
        );
  }
}

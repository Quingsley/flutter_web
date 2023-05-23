import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/github/data/models/github.model.dart';
import 'package:portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/providers/shared_providers.dart';

class GithubRepository implements IGithubRepository {
  final Ref ref;
  GithubRepository(this.ref);
  @override
  Future<GithubPageModel> getGithubData() {
    return ref.read(dbProvider).getPageDataFromDB(
          GithubPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.githubPage.name,
        );
  }
}

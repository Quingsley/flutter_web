import 'package:portfolio/features/github/data/models/github.model.dart';

abstract class IGithubRepository {
  Future<GithubPageModel> getGithubData();
}

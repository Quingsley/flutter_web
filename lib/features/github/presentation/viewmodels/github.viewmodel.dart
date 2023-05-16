import 'package:portfolio/features/github/data/models/github.model.dart';
import 'package:portfolio/features/github/data/repositories/igithub.repository.dart';

class GithubViewModel {
  final IGithubRepository githubRepository;
  GithubViewModel(
    this.githubRepository,
  );

  Future<GithubPageModel> getGithubData() async {
    var data = await githubRepository.getGithubData();
    return data;
  }
}

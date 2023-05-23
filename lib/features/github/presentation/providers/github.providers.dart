import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/github/data/repositories/github.repository.dart';
import 'package:portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:portfolio/features/github/presentation/viewmodels/github.viewmodel.dart';

final githubRepoProvider = Provider<IGithubRepository>(
    (ref) => GithubRepository(ref) /*MockGithubRepository()*/);

final githubViewModelProvider = Provider<GithubViewModel>((ref) {
  final repo = ref.read(githubRepoProvider);

  return GithubViewModel(repo);
});

final githubDataProvider = FutureProvider((ref) {
  final viewModel = ref.read(githubViewModelProvider);
  return viewModel.getGithubData();
});

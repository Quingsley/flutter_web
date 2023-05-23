import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:portfolio/features/twitter/data/repositories/itwitter.repository.dart';
import 'package:portfolio/features/twitter/data/repositories/twitter.repository.dart';
import 'package:portfolio/features/twitter/presentation/viewmodels/twitter.viewmodel.dart';

final twitterProvider = Provider<ITwitterRepository>((ref) {
  return TwitterRepository(ref) /*MockTwitterRepository()*/;
});

final twitterViewModelProvider = Provider<TwitterViewModel>((ref) {
  var repository = ref.read(twitterProvider);
  return TwitterViewModel(repository);
});

final twitterDataProvider = FutureProvider<TwitterPageModel>((ref) {
  var viewModel = ref.read(twitterViewModelProvider);
  return viewModel.getTwiterData();
});

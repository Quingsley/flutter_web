import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/web/data/models/web.model.dart';
import 'package:portfolio/features/web/data/repositories/iweb.repository.dart';
import 'package:portfolio/features/web/data/repositories/mockweb.repository.dart';
import 'package:portfolio/features/web/presentation/viewmodels/web_page.viewmodel.dart';

final webPageRepositoryProvider =
    Provider<IWebRepository>((ref) => MockWebRepository());

final webPageViewModelProvider = Provider<WebPageViewModel>((ref) {
  final repository = ref.read(webPageRepositoryProvider);
  return WebPageViewModel(repository);
});

final webPageDataProvider = FutureProvider<WebPageModel>((ref) {
  final viewModel = ref.read(webPageViewModelProvider);
  return viewModel.getWebPageData();
});

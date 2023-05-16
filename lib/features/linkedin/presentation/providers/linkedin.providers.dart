import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/linkedin/data/repositories/ilinkedin.repository.dart';
import 'package:portfolio/features/linkedin/data/repositories/mocklinkedin.repository.dart';
import 'package:portfolio/features/linkedin/presentation/viewmodels/linkedin.viewmodel.dart';

final linkedInProvider =
    Provider<ILinkedInRepository>((ref) => MockLinkedInRepository());

final linkedInViewModelProvider = Provider<LinkedInViewModel>((ref) {
  var repository = ref.read(linkedInProvider);
  return LinkedInViewModel(repository);
});

final linkedInDataProvider = FutureProvider((ref) {
  var data = ref.read(linkedInViewModelProvider);
  return data.getLinkedInData();
});

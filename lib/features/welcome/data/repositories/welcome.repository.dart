import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:portfolio/features/welcome/data/repositories/iwelcome.repository.dart';
import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/providers/shared_providers.dart';

class WelcomeRepository implements IwelcomeRepository {
  final Ref ref;
  WelcomeRepository(this.ref);

  @override
  Future<WelcomePageModel> getWelcomePageData() {
    return ref.read(dbProvider).getPageDataFromDB(
          WelcomePageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.welcomePage.name,
        );
  }
}

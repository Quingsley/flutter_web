import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/web/data/models/web.model.dart';
import 'package:portfolio/features/web/data/repositories/iweb.repository.dart';
import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/providers/shared_providers.dart';

class WebRepository implements IWebRepository {
  final Ref ref;
  WebRepository(this.ref);
  @override
  Future<WebPageModel> getWebData() {
    return ref.read(dbProvider).getPageDataFromDB(
          WebPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.webPage.name,
        );
  }
}

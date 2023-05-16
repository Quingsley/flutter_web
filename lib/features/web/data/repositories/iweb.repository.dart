import 'package:portfolio/features/web/data/models/web.model.dart';

abstract class IWebRepository {
  Future<WebPageModel> getWebData();
}

import 'package:portfolio/features/web/data/models/web.model.dart';
import 'package:portfolio/features/web/data/repositories/iweb.repository.dart';

class WebPageViewModel {
  final IWebRepository webRepository;

  WebPageViewModel(
    this.webRepository,
  );

  Future<WebPageModel> getWebPageData() async {
    return webRepository.getWebData();
  }
}

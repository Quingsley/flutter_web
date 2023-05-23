import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/github/presentation/providers/github.providers.dart';
import 'package:portfolio/features/linkedin/presentation/providers/linkedin.providers.dart';
import 'package:portfolio/features/twitter/presentation/providers/twitter_page.providers.dart';
import 'package:portfolio/features/web/presentation/providers/web_page.providers.dart';
import 'package:portfolio/features/welcome/presentation/providers/welcome_page.providers.dart';

class SplashPageViewModel {
  final Ref ref;
  SplashPageViewModel(this.ref);
  Future<bool> preloadPgaes() {
    Completer<bool> preloadCompleter = Completer();
    Future.wait([
      ref.read(welcomeProvider.future),
      ref.read(twitterDataProvider.future),
      ref.read(linkedInDataProvider.future),
      ref.read(webPageDataProvider.future),
      ref.read(githubDataProvider.future)
    ])
        .then(
          (value) => preloadCompleter.complete(true),
        )
        .catchError(
          (error) => preloadCompleter.completeError(error),
        )
        .onError(
          (error, stackTrace) => preloadCompleter.completeError(error!),
        );
    return preloadCompleter.future;
  }
}

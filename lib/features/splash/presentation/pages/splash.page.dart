import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/splash/presentation/providers/splash_page.providers.dart';
import 'package:portfolio/features/splash/presentation/widgets/splash_loading.dart';
import 'package:portfolio/features/welcome/presentation/pages/welcome.page.dart';
import 'package:portfolio/helpers/utils.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/styles/colors.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var splashFuture = ref.watch(splashPageFutureProvider);
    var loadingMessage = const SplashLoading(
      message: 'Loading an awesome,\nKick-ass Profile...',
    );

    return Scaffold(
      backgroundColor: PersonalPortfolioColors.mainBlue,
      body: splashFuture.when(
        data: (data) {
          Future.delayed(1.seconds, () {
            GoRouter.of(Utils.mainNav.currentContext!).go(WelcomePage.route);
          });
          return loadingMessage;
        },
        error: (error, stacktrace) =>
            ErrorNotification(message: error.toString()),
        loading: () => loadingMessage,
      ),
    );
  }
}

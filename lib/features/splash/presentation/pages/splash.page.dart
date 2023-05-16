import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/splash/presentation/widgets/splash_loading.dart';
import 'package:portfolio/features/welcome/presentation/pages/welcome.page.dart';
import 'package:portfolio/helpers/utils.dart';
import 'package:portfolio/styles/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(Utils.mainNav.currentContext!).go(WelcomePage.route);
    });
    return const Scaffold(
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: SplashLoading(
          message: 'Loading an awesome,\nKick-ass Profile...',
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/github/presentation/providers/github.providers.dart';
import 'package:portfolio/features/github/presentation/responsiveness/github_page_responsive.config.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/styles/colors.dart';

class GithubPage extends ConsumerWidget {
  const GithubPage({super.key});
  static const String route = "/github";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gitData = ref.watch(githubDataProvider);
    return gitData.when(
      data: (data) => SectionPageLayout(
        title: data.title,
        subtitle: data.subTitle,
        handle: data.handle,
        link: data.url,
        icon: data.icon,
      ),
      error: (error, stackTrace) =>
          ErrorNotification(message: error.toString()),
      loading: () => const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      )),
    );
  }
}

class SectionPageLayout extends StatelessWidget {
  const SectionPageLayout({
    super.key,
    this.title,
    this.subtitle,
    this.handle,
    this.link,
    this.icon,
    this.otherText,
  });

  final String? title;
  final String? subtitle;
  final String? handle;
  final String? link;
  final IconData? icon;
  final String? otherText;
  @override
  Widget build(BuildContext context) {
    var uiConfig = context.uiConfig<GithubResposniveConfig>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: uiConfig.iconSize,
            color: PersonalPortfolioColors.githubIcon,
          ),
          Text(
            title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: uiConfig.titleSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle ?? '',
            style: TextStyle(
              color: Colors.white.withOpacity(.25),
              fontSize: uiConfig.subtitleSize,
            ),
            textAlign: TextAlign.center,
          ),
          ContainerBtn(
            handle: handle ?? '',
            link: link ?? '',
          ),
        ]
            .animate(interval: 100.ms)
            .slideY(
              begin: 1,
              end: 0,
              duration: .5.seconds,
              curve: Curves.easeInOut,
            )
            .fadeIn(),
      ),
    );
  }
}

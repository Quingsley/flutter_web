import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/linkedin/presentation/providers/linkedin.providers.dart';
import 'package:portfolio/features/linkedin/presentation/responsiveness/linkedin_page_responsive.config.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/styles/colors.dart';

class LinkedInPage extends ConsumerWidget {
  const LinkedInPage({super.key});
  static const String route = "/linkedin";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(linkedInDataProvider);
    var uiConfig = context.uiConfig<LinkedInResponsiveConfig>();
    return data.when(
      data: (linkedInData) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              linkedInData.icon,
              size: uiConfig.iconSize,
              color: PersonalPortfolioColors.linkedInIcon,
            ),
            Text(
              linkedInData.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: uiConfig.titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              linkedInData.subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: uiConfig.subtitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            ContainerBtn(
              link: linkedInData.url,
              handle: linkedInData.handle,
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

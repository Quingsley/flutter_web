import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/twitter/presentation/providers/twitter_page.providers.dart';
import 'package:portfolio/features/twitter/presentation/responsiveness/twitter_page_responsive.config.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/styles/colors.dart';

class TwitterPage extends ConsumerWidget {
  const TwitterPage({super.key});
  static const String route = "/twitter";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final twitterData = ref.watch(twitterDataProvider);
    var uiConfig = context.uiConfig<TwitterPageResponsiveConfig>();
    return twitterData.when(
      data: (tweetData) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tweetData.icon,
              size: uiConfig.iconSize,
              color: PersonalPortfolioColors.twitterIcon,
            )
                .animate(
                  onPlay: (controller) => controller.repeat(
                    reverse: true,
                  ),
                )
                .scaleXY(
                  begin: .8,
                  end: 1,
                  duration: 1.seconds,
                  curve: Curves.easeInOut,
                ),
            Text(
              tweetData.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: uiConfig.titleSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              tweetData.subtitle,
              style: TextStyle(
                color: PersonalPortfolioColors.twitterIcon,
                fontSize: uiConfig.subtitleSize,
              ),
              textAlign: TextAlign.center,
            ),
            ContainerBtn(
              handle: tweetData.handle,
              link: tweetData.url,
            ),
          ]
              .animate(interval: 100.ms)
              .slideY(
                begin: 1,
                end: 0,
                duration: .5.seconds,
                curve: Curves.easeOut,
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

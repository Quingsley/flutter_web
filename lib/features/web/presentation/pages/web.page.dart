import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/web/presentation/providers/web_page.providers.dart';
import 'package:portfolio/features/web/presentation/responsiveness/web_page_responsive.config.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/styles/colors.dart';

class WebPage extends ConsumerWidget {
  const WebPage({super.key});
  static const String route = "/web";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webData = ref.watch(webPageDataProvider);
    var uiConfig = context.uiConfig<WebPageResponsiveConfig>();
    return webData.when(
      data: (data) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              size: uiConfig.iconSize,
              color: PersonalPortfolioColors.webIcon,
            ),
            Text(
              data.title,
              style: TextStyle(
                  fontSize: uiConfig.titleSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              data.subTitle,
              style: TextStyle(
                  fontSize: uiConfig.subtitleSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ContainerBtn(link: data.url, handle: data.handle),
          ]
              .animate(
                interval: 100.ms,
              )
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

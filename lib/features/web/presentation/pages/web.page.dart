import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/web/presentation/providers/web_page.providers.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WebPage extends ConsumerWidget {
  const WebPage({super.key});
  static const String route = "/web";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webData = ref.watch(webPageDataProvider);

    return webData.when(
      data: (data) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              size: 100,
              color: Colors.white.withOpacity(.25),
            ),
            Text(
              data.title,
              style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              data.subTitle,
              style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
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

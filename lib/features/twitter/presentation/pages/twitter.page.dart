import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/twitter/presentation/providers/twitter_page.providers.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TwitterPage extends ConsumerWidget {
  const TwitterPage({super.key});
  static const String route = "/twitter";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final twitterData = ref.watch(twitterDataProvider);

    return twitterData.when(
      data: (tweetData) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tweetData.icon,
              size: 100,
              color: Colors.blue,
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              tweetData.subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(.25),
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
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

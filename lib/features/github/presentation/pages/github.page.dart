import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/github/presentation/providers/github.providers.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/shared/widgets/custom_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color: Colors.white.withOpacity(.25),
          ),
          Text(
            title ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle ?? '',
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

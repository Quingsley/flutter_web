import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/presentation/providers/welcome_page.providers.dart';
import 'package:portfolio/features/welcome/presentation/widgets/greetings_label.dart';
import 'package:portfolio/shared/error_notification.dart';
import 'package:portfolio/styles/colors.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  static const String route = '/welcome';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var welcomeDataAsync = ref.watch(welcomeProvider);
    return welcomeDataAsync.when(
      data: (welcomeData) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PersonalPortfolioColors.welcomePrimary,
                      width: 8,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(welcomeData.imgPath),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Icon(
                  PersonalPortfolioIcons.wave,
                  size: 90,
                  color: PersonalPortfolioColors.welcomeIcon,
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(
                        reverse: true,
                      ),
                    )
                    .rotate(
                      begin: -.25,
                      end: 0,
                      curve: Curves.easeInOut,
                    )
              ],
            ),
            const GreetingsLabel(),
            Text.rich(
              TextSpan(
                  style: const TextStyle(fontSize: 100, color: Colors.white),
                  children: [
                    const TextSpan(text: "I'm "),
                    TextSpan(
                        text: welcomeData.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ]),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(PersonalPortfolioIcons.badge,
                    color: PersonalPortfolioColors.welcomePrimary, size: 80),
                const SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(welcomeData.title,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white)),
                    Text(welcomeData.subTitle,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white)),
                  ],
                )
              ],
            )
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

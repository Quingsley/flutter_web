import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/presentation/providers/welcome_page.providers.dart';
import 'package:portfolio/features/welcome/presentation/responsiveness/welcome_page_responsive.config.dart';
import 'package:portfolio/features/welcome/presentation/viewmodels/greetings_label.viemodel.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';

class GreetingsLabel extends ConsumerStatefulWidget {
  const GreetingsLabel({super.key});

  @override
  ConsumerState<GreetingsLabel> createState() => _GreetingsLabelState();
}

class _GreetingsLabelState extends ConsumerState<GreetingsLabel> {
  late GreetingsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = ref.read(greetingsViewModelProvider.notifier);
    vm.initializeGreetings();
  }

  @override
  void dispose() {
    vm.resetTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var uiConfig = WelcomePageResponsiveConfig
        .responsiveUi[ResponsiveUIHelper.getDeviceType(context)]!;
    var greeting = ref.watch(greetingsViewModelProvider);
    return Text(
      greeting,
      style: TextStyle(
        fontSize: uiConfig.titleSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

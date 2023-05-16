import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/presentation/pages/welcome.page.dart';
import 'package:portfolio/styles/colors.dart';

final pageColorProvider = StateProvider<LinearGradient>(
    (ref) => PersonalPortfolioColors.pageColor[WelcomePage.route]!);

final bgPageRouteProvider = StateProvider<String>((ref) {
  return WelcomePage.route;
});

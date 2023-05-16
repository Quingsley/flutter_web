import 'package:flutter/material.dart';
import 'package:portfolio/features/shell/presentation/widgets/left_navigation.dart';
import 'package:portfolio/helpers/utils.dart';
import 'package:portfolio/shared/widgets/bganimation.dart';
import 'package:portfolio/shared/widgets/pagecolor.dart';
import 'package:portfolio/styles/colors.dart';

class PortfolioMainPage extends StatelessWidget {
  const PortfolioMainPage({super.key, required this.child});

  final Widget child;
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Utils.mainScaffold,
      backgroundColor: PersonalPortfolioColors.mainBlue,
      body: Stack(
        children: [
          const PageColor(),
          const BgAnimation(),
          Center(
            child: child,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: LeftNavigation(),
          ),
        ],
      ),
    );
  }
}

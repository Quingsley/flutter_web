import 'package:flutter/material.dart';
import 'package:portfolio/features/navigation/presentation/responsiveness/naviagtion_responsive.config.dart';
import 'package:portfolio/features/navigation/presentation/widgets/left_navigation.dart';
import 'package:portfolio/features/navigation/presentation/widgets/side_navigation_drawer.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';
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
      drawer: const SideNavigationDrawer(),
      body: Builder(
        builder: (context) {
          var navUIConfig = NavigationResponsiveConfig
              .responsiveUI[ResponsiveUIHelper.getDeviceType(context)]!;
          if (!navUIConfig.showSideBar &&
              Utils.mainScaffold.currentState!.isDrawerOpen) {
            Utils.mainScaffold.currentState!.closeDrawer();
          }
          return Stack(
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
          );
        },
      ),
    );
  }
}

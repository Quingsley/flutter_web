import 'package:portfolio/helpers/enums.dart';

class NavigationResponsiveConfig {
  final bool showSideBar;

  NavigationResponsiveConfig({
    required this.showSideBar,
  });

  static Map<DeviceType, NavigationResponsiveConfig> responsiveUI = {
    DeviceType.mobile: NavigationResponsiveConfig(
      showSideBar: false,
    ),
    DeviceType.tablet: NavigationResponsiveConfig(
      showSideBar: true,
    ),
    DeviceType.desktop: NavigationResponsiveConfig(
      showSideBar: true,
    ),
  };
}

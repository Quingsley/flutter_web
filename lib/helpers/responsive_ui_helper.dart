import 'package:flutter/material.dart';
import 'package:portfolio/features/linkedin/presentation/responsiveness/linkedin_page_responsive.config.dart';
import 'package:portfolio/features/twitter/presentation/responsiveness/twitter_page_responsive.config.dart';
import 'package:portfolio/features/web/presentation/responsiveness/web_page_responsive.config.dart';
import 'package:portfolio/features/welcome/presentation/responsiveness/welcome_page_responsive.config.dart';
import 'package:portfolio/shared/models/iresposnsive.config.dart';
import './enums.dart';

class ResponsiveUIHelper {
  static const int mobileMaxWidth = 375;
  static const int tabletMaxWidth = 768;
  static const int desktopMaxWidth = 1024;

  static DeviceType getDeviceType(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceWidth = deviceSize.width;

    if (deviceWidth > ResponsiveUIHelper.desktopMaxWidth) {
      return DeviceType.desktop;
    }
    if (deviceWidth > ResponsiveUIHelper.tabletMaxWidth) {
      return DeviceType.tablet;
    }
    return DeviceType.mobile;
  }
}

extension GetResponsiveUIConfig on BuildContext {
  T uiConfig<T>() {
    late IResponsiveConfig configClass;
    DeviceType device = ResponsiveUIHelper.getDeviceType(this);

    switch (T) {
      case WelcomePageResponsiveConfig:
        configClass = WelcomePageResponsiveConfig.responsiveUi[device]!;
        break;
      case TwitterPageResponsiveConfig:
        configClass = TwitterPageResponsiveConfig.responsiveUi[device]!;
        break;
      case LinkedInResponsiveConfig:
        configClass = LinkedInResponsiveConfig.responsiveUi[device]!;
        break;
      case WebPageResponsiveConfig:
        configClass = WebPageResponsiveConfig.responsiveUI[device]!;
        break;
    }
    return configClass as T;
  }
}

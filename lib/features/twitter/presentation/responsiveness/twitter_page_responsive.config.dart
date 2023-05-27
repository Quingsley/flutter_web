import 'package:flutter/material.dart';
import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/models/iresposnsive.config.dart';

class TwitterPageResponsiveConfig implements IResponsiveConfig {
  final double iconSize;
  final double titleSize;
  final double subtitleSize;
  final double buttonLabelSize;
  final EdgeInsets buttonPadding;
  final EdgeInsets buttonMargin;

  TwitterPageResponsiveConfig({
    required this.iconSize,
    required this.titleSize,
    required this.subtitleSize,
    required this.buttonLabelSize,
    required this.buttonPadding,
    required this.buttonMargin,
  });

  static Map<DeviceType, TwitterPageResponsiveConfig> responsiveUi = {
    DeviceType.mobile: TwitterPageResponsiveConfig(
      iconSize: 40,
      titleSize: 60,
      subtitleSize: 20,
      buttonLabelSize: 20,
      buttonPadding: const EdgeInsets.only(top: 20),
      buttonMargin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    DeviceType.tablet: TwitterPageResponsiveConfig(
        iconSize: 60,
        titleSize: 80,
        subtitleSize: 30,
        buttonLabelSize: 20,
        buttonPadding: const EdgeInsets.only(top: 20),
        buttonMargin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    DeviceType.desktop: TwitterPageResponsiveConfig(
      iconSize: 80,
      titleSize: 100,
      subtitleSize: 40,
      buttonLabelSize: 30,
      buttonPadding: const EdgeInsets.only(top: 20),
      buttonMargin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    )
  };
}

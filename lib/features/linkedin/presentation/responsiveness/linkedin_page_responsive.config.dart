import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/models/iresposnsive.config.dart';

class LinkedInResponsiveConfig implements IResponsiveConfig {
  final double iconSize;
  final double titleSize;
  final double subtitleSize;
  LinkedInResponsiveConfig({
    required this.titleSize,
    required this.subtitleSize,
    required this.iconSize,
  });

  static Map<DeviceType, LinkedInResponsiveConfig> responsiveUi = {
    DeviceType.mobile: LinkedInResponsiveConfig(
      titleSize: 60,
      subtitleSize: 20,
      iconSize: 40,
    ),
    DeviceType.tablet: LinkedInResponsiveConfig(
      titleSize: 80,
      subtitleSize: 30,
      iconSize: 60,
    ),
    DeviceType.desktop: LinkedInResponsiveConfig(
      titleSize: 100,
      subtitleSize: 40,
      iconSize: 80,
    ),
  };
}

import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/models/iresposnsive.config.dart';

class WebPageResponsiveConfig implements IResponsiveConfig {
  final double titleSize;
  final double subtitleSize;
  final double iconSize;
  WebPageResponsiveConfig({
    required this.titleSize,
    required this.subtitleSize,
    required this.iconSize,
  });
  static Map<DeviceType, WebPageResponsiveConfig> responsiveUI = {
    DeviceType.mobile: WebPageResponsiveConfig(
      titleSize: 60,
      subtitleSize: 20,
      iconSize: 40,
    ),
    DeviceType.tablet: WebPageResponsiveConfig(
      titleSize: 80,
      subtitleSize: 30,
      iconSize: 60,
    ),
    DeviceType.desktop: WebPageResponsiveConfig(
      titleSize: 100,
      subtitleSize: 40,
      iconSize: 60,
    )
  };
}

import 'package:portfolio/helpers/enums.dart';
import 'package:portfolio/shared/models/iresposnsive.config.dart';

class GithubResposniveConfig implements IResponsiveConfig {
  final double titleSize;
  final double subtitleSize;
  final double iconSize;
  GithubResposniveConfig({
    required this.titleSize,
    required this.subtitleSize,
    required this.iconSize,
  });

  static Map<DeviceType, GithubResposniveConfig> responsiveUI = {
    DeviceType.mobile: GithubResposniveConfig(
      titleSize: 60,
      subtitleSize: 20,
      iconSize: 40,
    ),
    DeviceType.tablet: GithubResposniveConfig(
      titleSize: 80,
      subtitleSize: 30,
      iconSize: 60,
    ),
    DeviceType.desktop: GithubResposniveConfig(
      titleSize: 100,
      subtitleSize: 40,
      iconSize: 80,
    ),
  };
}

import 'package:flutter/material.dart';
import 'package:portfolio/features/twitter/presentation/responsiveness/twitter_page_responsive.config.dart';
import 'package:portfolio/helpers/responsive_ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerBtn extends StatelessWidget {
  const ContainerBtn({
    super.key,
    required this.link,
    required this.handle,
  });

  final String link;
  final String handle;
  @override
  Widget build(BuildContext context) {
    var uiConfig = TwitterPageResponsiveConfig
        .responsiveUi[ResponsiveUIHelper.getDeviceType(context)]!;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final Uri url = Uri.parse(link);

          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: Container(
          margin: uiConfig.buttonMargin,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Text(
            handle,
            style: TextStyle(
              color: Colors.white,
              fontSize: uiConfig.buttonLabelSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

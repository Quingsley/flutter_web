import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            handle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

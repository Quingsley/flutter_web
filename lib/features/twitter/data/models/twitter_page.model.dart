import 'package:flutter/material.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class TwitterPageModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String handle;
  final String url;

  TwitterPageModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.handle,
    required this.url,
  });

  factory TwitterPageModel.fromDatabase(Map<String, dynamic> doc) {
    return TwitterPageModel(
      icon: PersonalPortfolioIcons.iconMap[doc['icon']]!,
      title: doc['title'],
      subtitle: doc['subtitle'],
      handle: doc['handle'],
      url: doc['url'],
    );
  }
}

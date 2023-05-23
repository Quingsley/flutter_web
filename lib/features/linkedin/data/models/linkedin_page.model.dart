import 'package:flutter/material.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class LinkedInPageModel {
  final String title;
  final String subtitle;
  final String url;
  final String handle;
  final IconData icon;

  LinkedInPageModel({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.handle,
    required this.icon,
  });

  factory LinkedInPageModel.fromDatabase(Map<String, dynamic> doc) {
    return LinkedInPageModel(
      title: doc['title'],
      subtitle: doc['subtitle'],
      url: doc['url'],
      handle: doc['handle'],
      icon: PersonalPortfolioIcons.iconMap[doc['icon']]!,
    );
  }
}

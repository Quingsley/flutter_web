import 'package:flutter/material.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class WebPageModel {
  final String title;
  final String subTitle;
  final String url;
  final String handle;
  final IconData icon;

  WebPageModel({
    required this.title,
    required this.subTitle,
    required this.url,
    required this.handle,
    required this.icon,
  });

  factory WebPageModel.fromDatabase(Map<String, dynamic> doc) {
    return WebPageModel(
      title: doc['title'],
      subTitle: doc['subTitle'],
      url: doc['url'],
      handle: doc['handle'],
      icon: PersonalPortfolioIcons.iconMap[doc['icon']]!,
    );
  }
}

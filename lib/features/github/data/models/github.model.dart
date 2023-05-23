import 'package:flutter/material.dart';
import 'package:portfolio/styles/personal_portfolio_icons.dart';

class GithubPageModel {
  final String title;
  final String subTitle;
  final String url;
  final String handle;
  final IconData icon;

  GithubPageModel({
    required this.title,
    required this.subTitle,
    required this.handle,
    required this.icon,
    required this.url,
  });
  factory GithubPageModel.fromDatabase(Map<String, dynamic> doc) {
    return GithubPageModel(
      title: doc['title'],
      subTitle: doc['subtitle'],
      url: doc['url'],
      handle: doc['handle'],
      icon: PersonalPortfolioIcons.iconMap[doc['icon']]!,
    );
  }
}

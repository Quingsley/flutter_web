import 'package:flutter/material.dart';

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
}

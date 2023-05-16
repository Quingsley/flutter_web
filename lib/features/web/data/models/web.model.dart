import 'package:flutter/material.dart';

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
}

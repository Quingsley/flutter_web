import 'package:flutter/material.dart';

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
}

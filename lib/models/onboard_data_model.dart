import 'package:flutter/widgets.dart';

class OnboardDataModel {
  OnboardDataModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  int id;
  String imageUrl;
  String title;
  String subtitle;
  Color color;
}

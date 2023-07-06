import 'package:flutter/material.dart';

class CustomRoute {
  static final CustomRoute _route = CustomRoute._internal();

  factory CustomRoute() {
    return _route;
  }

  CustomRoute._internal();

  Future<dynamic> pushRemove({required BuildContext context, required page}) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
        (route) => false);
  }

  Future<dynamic> push({required BuildContext context, required page}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }
}

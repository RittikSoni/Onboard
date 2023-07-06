import 'package:flutter/material.dart';
import 'package:rs_onboard/constant/style.dart';
import 'package:rs_onboard/screens/login.dart';
import 'package:rs_onboard/screens/register.dart';
import 'package:rs_onboard/utils/route.dart';

Future<dynamic> customBottomSheet({
  required BuildContext context,
  String? title,
  String? subtitle,
  String? imageUrl,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            child: Column(
              children: [
                const Text(
                  'Lorem Ipsum',
                  textAlign: TextAlign.center,
                  style: CustomStyle.headingTextStyle,
                ),
                const SizedBox(
                  width: 320.0,
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ornare, erat ac auctor gravida.',
                      textAlign: TextAlign.center,
                      style: CustomStyle.subHeadingTextStyle),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Image.asset(
                  'assets/images/img_1.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: customButtonStyle(),
                      onPressed: () {
                        CustomRoute().pushRemove(
                            context: context, page: const Register());
                      },
                      child: const Text('Start your application')),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        CustomRoute()
                            .pushRemove(context: context, page: const Login());
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

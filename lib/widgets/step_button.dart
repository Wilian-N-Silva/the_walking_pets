import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget onboardingStepButton(
    BuildContext context, route, String title, bool replace) {
  return TextButton(
    style: TextButton.styleFrom(primary: Colors.grey),
    onPressed: () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding', true);

      if (replace) {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => route,
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      }
    },
    child: Text(title),
  );
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget walkThroughStepButton(
  BuildContext context,
  route,
  String title,
  bool replace,
) {
  return TextButton(
    style: TextButton.styleFrom(primary: Colors.grey),
    onPressed: () async {
      if (replace) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onboarding', true);
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => route,
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => route,
          ),
        );
      }
    },
    child: Text(title),
  );
}

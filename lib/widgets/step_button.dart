import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget stepButton(BuildContext context, route, String title) {
  return TextButton(
    style: TextButton.styleFrom(primary: Colors.grey),
    onPressed: () {
      // Navigator.of(context).pushReplacementNamed('/presentationTwo');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      );
    },
    child: Text(title),
  );
}

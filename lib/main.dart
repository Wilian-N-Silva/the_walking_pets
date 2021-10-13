import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_walking_pets/config/themes/default_theme.dart';
import 'package:the_walking_pets/config/themes/dark_theme.dart';
import 'package:the_walking_pets/core/walk_through/walk_through_1.dart';
import 'package:the_walking_pets/core/auth/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    route: prefs.getBool('onboarding') == null
        ? const WalkThrough1()
        : const SigninPage(),
    // route: OnboardingStepOne(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.route}) : super(key: key);

  final Widget route;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = false;
    return MaterialApp(
      title: 'The Walking Pets',
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? darkThemeData : defaultThemeData,
      home: route,
    );
  }
}

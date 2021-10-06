import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_walking_pets/screens/signin.dart';
import 'package:the_walking_pets/screens/onboarding/step_one.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    route: prefs.getBool('onboarding') == null
        ? const OnboardingStepOne()
        : const SigninPage(),
    // route: OnboardingStepOne(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.route}) : super(key: key);

  final Widget route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Walking Pets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent.shade400,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.lightBlueAccent.shade400,
          foregroundColor: Colors.white,
        ),
      ),
      home: route,
    );
  }
}

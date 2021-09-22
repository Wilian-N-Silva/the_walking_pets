import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_walking_pets/data/settings.dart';
import 'package:the_walking_pets/screens/login.dart';
import 'package:the_walking_pets/screens/onboarding/step_one.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isOnboardingComplete =
      prefs.getBool('onboarding') == null ? false : true;

  runApp(MyApp(
    route: isOnboardingComplete ? const LoginPage() : const OnboardingStepOne(),
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
        primarySwatch: Colors.blue,
      ),
      home: route,
    );
  }
}

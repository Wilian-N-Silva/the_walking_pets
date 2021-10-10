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
        // colorScheme: ColorScheme(
        //     // Theme.of(context).colorScheme.primary
        //     primary: Colors.lightBlueAccent.shade400,
        //     primaryVariant: Colors.lightBlueAccent.shade700,
        //     secondary: Colors.lightBlueAccent.shade700,
        //     secondaryVariant: Colors.lightBlueAccent.shade700,
        //     surface: Colors.lightBlueAccent.shade400,
        //     background: Colors.lightBlueAccent.shade400,
        //     error: Colors.lightBlueAccent.shade400,
        //     onPrimary: Colors.lightBlueAccent.shade400,
        //     onSecondary: Colors.lightBlueAccent.shade400,
        //     onSurface: Colors.lightBlueAccent.shade400,
        //     onBackground: Colors.lightBlueAccent.shade400,
        //     onError: Colors.lightBlueAccent.shade400,
        //     brightness: Brightness.light),
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

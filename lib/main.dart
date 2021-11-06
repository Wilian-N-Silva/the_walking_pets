import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_walking_pets/utilities/themes/default_theme.dart';
import 'package:the_walking_pets/utilities/themes/dark_theme.dart';
import 'package:the_walking_pets/screens/walk_through/walk_through_1.dart';
import 'package:the_walking_pets/screens/auth/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    route: prefs.getBool('onboarding') == null
        ? const WalkThrough1()
        : const SigninPage(),
    // route: WalkThrough1(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.route}) : super(key: key);

  final Widget route;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = false;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'The Walking Pets',
        debugShowCheckedModeBanner: false,
        theme: isDarkTheme ? darkThemeData : defaultThemeData,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        home: route,
      ),
    );
  }
}

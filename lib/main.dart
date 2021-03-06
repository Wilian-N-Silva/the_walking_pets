import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_walking_pets/config/themes/default_theme.dart';
import 'package:the_walking_pets/config/themes/dark_theme.dart';
import 'package:the_walking_pets/core/walk_through/screens/walk_through_1.dart';
import 'package:the_walking_pets/core/auth/signin/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? onboarding = prefs.getBool('onboarding');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  runApp(MyApp(
    route: onboarding == null ? const WalkThrough1() : const SigninPage(),
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

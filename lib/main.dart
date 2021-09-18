import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/home.dart';
import 'package:the_walking_pets/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Walking Pets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        // colorScheme: ColorScheme(secondary: Colors.blue),
      ),
      // routes: <String, WidgetBuilder>{
      //   '/presentationOne': (BuildContext context) => const PresentationOne(),
      //   '/presentationTwo': (BuildContext context) => const PresentationTwo(),
      // },
      // initialRoute: '/presentationOne',
      home: const LoginPage(),
    );
  }
}

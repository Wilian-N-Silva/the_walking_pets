import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  bool commonForm = true;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              commonForm ? commonUserForm() : partnerUserForm(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget commonUserForm() {
  return Column(
    children: const <Widget>[
      Text('Comum'),
      SizedBox(
        height: 48.0,
        child: TextField(
          decoration: InputDecoration(
            label: Text('Nome'),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ],
  );
}

Widget partnerUserForm() {
  return Column(
    children: const <Widget>[
      Text('Parceiro'),
      SizedBox(
        height: 48.0,
        child: TextField(
          decoration: InputDecoration(
            label: Text('Nome'),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ],
  );
}

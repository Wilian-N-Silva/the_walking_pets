import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key, required this.isPartner}) : super(key: key);

  final bool isPartner;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              widget.isPartner ? partnerUserForm() : commonUserForm(),
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

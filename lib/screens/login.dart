import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(height: 16.0),
            Column(
              children: const [
                Text(
                  'Mas me diga...\nJá nos vimos antes?',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 300.0,
                  child: RiveAnimation.asset(
                    'assets/animations/cautious_dog_bro.riv',
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: null,
                      child: const Text('Entrar'),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size(150, 50),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.amberAccent.shade100,
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      width: 200.0,
                      child: const Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        platformLoginButton(context, TargetPlatform.android),
                        platformLoginButton(context, TargetPlatform.iOS),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget platformLoginButton(BuildContext context, TargetPlatform platform) {
  return ElevatedButton(
    onPressed: null,
    child: Text(
        'Entrar com ${platform == TargetPlatform.iOS ? 'Apple' : 'Google'}'),
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.amberAccent.shade100),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rive/rive.dart';
import 'package:the_walking_pets/screens/adoption.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Mas me diga...\nJá nos vimos antes?',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: const RiveAnimation.asset(
                          'assets/animations/blue/cautious_dog_bro.riv',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 48.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const SizedBox(
                          height: 48.0,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Adoption(),
                              ),
                            );
                          },
                          child: const Text('Entrar'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size(256, 48),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlueAccent.shade400,
                            ),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          width: 200.0,
                          child: const Divider(),
                        ),
                        platformLoginButton(context, TargetPlatform.android),
                        const SizedBox(height: 16.0),
                        platformLoginButton(context, TargetPlatform.iOS),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          width: 200.0,
                          child: const Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não tem uma conta?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Cadastre-se',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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
      fixedSize: MaterialStateProperty.all<Size>(const Size(256, 48)),
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.lightBlueAccent.shade400),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  );
}

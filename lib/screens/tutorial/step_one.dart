import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:the_walking_pets/screens/login.dart';
import 'package:the_walking_pets/screens/tutorial/step_two.dart';
import 'package:the_walking_pets/widgets/step_button.dart';

class TutorialStepOne extends StatelessWidget {
  const TutorialStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Textos
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Seja bem-vindo(a) ao',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 350.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'The Walking Pets',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Aqui você pode encontrar seu mais novo amigo pet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Animação
            const SizedBox(
              height: 300.0,
              child: RiveAnimation.asset(
                'assets/animations/good_doggy_pana.riv',
                animations: ['intro', 'idle'],
                controllers: [],
              ),
            ),

            // Botões
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  stepButton(context, const LoginPage(), 'Pular'),
                  stepButton(context, const TutorialStepTwo(), 'Próximo'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

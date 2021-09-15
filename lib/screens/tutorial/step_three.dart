import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:the_walking_pets/screens/login.dart';
import 'package:the_walking_pets/screens/tutorial/step_two.dart';
import 'package:the_walking_pets/widgets/step_button.dart';

class TutorialStepThree extends StatelessWidget {
  const TutorialStepThree({Key? key}) : super(key: key);

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
                children: const [
                  Text(
                    'Além de encontrar serviços em sua região, desde petshops até veterinários especializados!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
            ),

            // Animação
            const SizedBox(
              height: 300.0,
              child: RiveAnimation.asset(
                'assets/animations/veterinary_pana.riv',
                animations: ['intro', 'idle'],
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
                  stepButton(context, const TutorialStepTwo(), 'Voltar'),
                  stepButton(context, const LoginPage(), 'Próximo'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

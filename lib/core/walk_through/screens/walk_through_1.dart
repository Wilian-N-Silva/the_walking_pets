import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:the_walking_pets/core/walk_through/screens/walk_through_2.dart';
import 'package:the_walking_pets/core/auth/signin/signin.dart';
import 'package:the_walking_pets/widgets/walk_through_step_button.dart';

class WalkThrough1 extends StatelessWidget {
  const WalkThrough1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                      height: (MediaQuery.of(context).size.height - 50.0) / 2,
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
              SizedBox(
                height: (MediaQuery.of(context).size.height - 50.0) / 3,
                child: const RiveAnimation.asset(
                  'assets/animations/blue/good_doggy_pana.riv',
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
                    walkThroughStepButton(
                        context, const SigninPage(), 'Pular', true),
                    walkThroughStepButton(
                        context, const WalkThrough2(), 'Próximo', false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

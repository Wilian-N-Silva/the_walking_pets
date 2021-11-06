import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:the_walking_pets/screens/walk_through/walk_through_1.dart';
import 'package:the_walking_pets/screens/walk_through/walk_through_3.dart';
import 'package:the_walking_pets/widgets/walk_through_step_button.dart';

class WalkThrough2 extends StatelessWidget {
  const WalkThrough2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         SizedBox(
    //           height: 350.0,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: const [
    //               Text(
    //                 'Ajudar ou pedir ajuda com algum pet perdido',
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Column(
    //           children: [
    //             const SizedBox(
    //               width: double.infinity,
    //               height: 300.0,
    //               child: RiveAnimation.asset(
    //                 'assets/animations/good_doggy_bro.riv',
    //               ),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 stepButton(context, const TutorialStepOne(), 'Voltar'),
    //                 stepButton(context, const TutorialStepThree(), 'Próximo')
    //               ],
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );

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
                  children: const [
                    Text(
                      'Ajudar ou pedir ajuda com algum pet perdido',
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
                  'assets/animations/blue/good_doggy_bro.riv',
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
                        context, const WalkThrough1(), 'Voltar', false),
                    walkThroughStepButton(
                        context, const WalkThrough3(), 'Próximo', false),
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

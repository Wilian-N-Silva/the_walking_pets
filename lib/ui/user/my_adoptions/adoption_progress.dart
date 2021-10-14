import 'package:flutter/material.dart';

class AdoptionProgress extends StatefulWidget {
  const AdoptionProgress({Key? key}) : super(key: key);

  @override
  _AdoptionProgressState createState() => _AdoptionProgressState();
}

class _AdoptionProgressState extends State<AdoptionProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stepper(
          controlsBuilder: (BuildContext context,
              {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
            return Container();
          },
          type: StepperType.vertical,
          currentStep: 0,
          steps: const <Step>[
            Step(
              isActive: true,
              state: StepState.indexed,
              title: Text('Formulário'),
              content: Text('Preenchimento do formulário de triagem'),
            ),
            Step(
              isActive: true,
              state: StepState.indexed,
              title: Text('Triagem'),
              content: Text('Triagem dos formulários realizada pelo doador'),
            ),
            Step(
              isActive: true,
              state: StepState.indexed,
              title: Text('Entrevista'),
              content: Text('Entrevista realizada pelo doador'),
            ),
            Step(
              isActive: true,
              state: StepState.indexed,
              title: Text('Parabéns!'),
              content: Text('Doação'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingContent {
  OnboardingContent({
    this.title,
    this.content,
    required this.asset,
    this.animations = const [],
    this.reverse,
  });

  String? title;
  String asset;
  List<String> animations;
  String? content;
  bool? reverse;
}

List<OnboardingContent> onboardingData(BuildContext context) {
  return [
    OnboardingContent(
      content: 'ola1',
      asset: 'assets/animations/blue/good_doggy_pana.riv',
      animations: ['intro', 'idle'],
    ),
    OnboardingContent(
      content: 'ola2',
      asset: 'assets/animations/blue/good_doggy_bro.riv',
    ),
    OnboardingContent(
      content: 'ola3',
      asset: 'assets/animations/blue/veterinary_pana.riv',
      animations: ['intro', 'idle'],
    ),
  ];
}

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text(
              'Pular',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(onboardingData(context).elementAt(0)),
              makePage(onboardingData(context).elementAt(1)),
              makePage(onboardingData(context).elementAt(2)),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage(OnboardingContent data) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: RiveAnimation.asset(
            data.asset,
            // animations: data.animations,
          ),
        ),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

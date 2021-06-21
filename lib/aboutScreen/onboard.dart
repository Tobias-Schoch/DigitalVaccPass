import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../loginScreen/login.dart';
import '../utils/app_bar.dart';
import '../utils/util.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const MyLoginPage()),
    );
  }

  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const MyHeader(),
        elevation: 0,
      ),
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: 'Dein Impfpass',
            body: 'Hole dir jetzt deinen digitalen Impfpass und vergiss ihn nie wieder.',
            image: _buildImage('img1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'Familienübersicht',
            body:
                'Verwalte die Impfungen für die kleinsten in der Familie.',
            image: _buildImage('img2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'Dir gehören deine Daten',
            body:
                'Deine Daten gehören nur dir. Deshalb werden die Daten nur auf deinem Handy gespeichert.',
            image: _buildImage('img3.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Überspringen',
            style: TextStyle(color: PredefinedColors.textColor)),
        next:
            const Icon(Icons.arrow_forward, color: PredefinedColors.textColor),
        done: const Text('Fertig',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: PredefinedColors.textColor)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: PredefinedColors.textColor,
          activeColor: PredefinedColors.primaryColor,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: PredefinedColors.accentWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ));
}

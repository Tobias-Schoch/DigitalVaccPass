import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../homeScreen/home.dart';
import '../utils/app_bar.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => MyHomeScreenPage(selectedTabIndex: 0,)),
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
            title: AppLocalizations.of(context).yourVaccPass,
            body: AppLocalizations.of(context).getYourVaccPass,
            image: _buildImage('img1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: AppLocalizations.of(context).familyOverview,
            body: AppLocalizations.of(context).onBoardScreenManageVaccineForFamily,
            image: _buildImage('img2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: AppLocalizations.of(context).dataIsYours,
            body: AppLocalizations.of(context).dataIsYourSavedOnlyOnMobile,
            image: _buildImage('img3.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: Text(AppLocalizations.of(context).skip,
            style: TextStyle(color: Theme.of(context).accentColor)),
        next:
            Icon(Icons.arrow_forward, color: Theme.of(context).primaryColorLight),
        done: Text(AppLocalizations.of(context).done,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColorLight)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: Theme.of(context).primaryColorLight,
          activeColor: Theme.of(context).accentColor,
          activeSize: const Size(22.0, 10.0),
          activeShape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ));
}

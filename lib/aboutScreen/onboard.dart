import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../homeScreen/home.dart';
import '../utils/app_bar.dart';

/// Onboarding Screen
class OnBoardingPage extends StatefulWidget {
  /// Onboarding Screen
  const OnBoardingPage({Key key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_) => MyHomeScreenPage(
                selectedTabIndex: 0,
              )),
    );
  }

  final PageDecoration pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19),
    descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetName, [double width = 350]) =>
      Image.asset('assets/images/$assetName', width: width);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            body: AppLocalizations.of(context)
                .onBoardScreenManageVaccineForFamily,
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
        next: Icon(Icons.arrow_forward,
            color: Theme.of(context).primaryColorLight),
        done: Text(AppLocalizations.of(context).done,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColorLight)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12)
            : const EdgeInsets.fromLTRB(8, 4, 8, 4),
        dotsDecorator: DotsDecorator(
          size: const Size(10, 10),
          color: Theme.of(context).primaryColorLight,
          activeColor: Theme.of(context).accentColor,
          activeSize: const Size(22, 10),
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        dotsContainerDecorator: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ));

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GlobalKey<IntroductionScreenState>>(
        'introKey_onboard', introKey));
    properties.add(DiagnosticsProperty<PageDecoration>(
        'pageDecoration_onboard', pageDecoration));
  }
}

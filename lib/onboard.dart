import 'package:digital_vac_pass/main.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

class MyOnboardPage extends StatefulWidget {
  MyOnboardPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyOnboardPageState createState() => _MyOnboardPageState();
}

class _MyOnboardPageState extends State<MyOnboardPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    const primeColorAccent = const Color(0xff7577f8);
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: OnBoard(
          pageController: _pageController,
          onSkip: () {
            print("Skipped");
          },
          onDone: () {
            print("Done");
          },
          imageWidth: MediaQuery.of(context).size.width * 0.15,
          onBoardData: onBoardData,
          titleStyles: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 16,
            color: Colors.brown.shade300,
          ),
          pageIndicatorStyle: PageIndicatorStyle(
            width: 100,
            inactiveColor: primeColorAccent,
            activeColor: Theme.of(context).accentColor,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          skipButton: TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: primeColorAccent),
            ),
          ),
          nextButton: Consumer<OnBoardState>(
            builder: (BuildContext context, OnBoardState state, Widget child) {
              return InkWell(
                onTap: () => _onNextTap(state),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Theme.of(context).accentColor, primeColorAccent],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Anleitung beenden" : "Nächste Seite",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}

void _onNextTap(OnBoardState onBoardState) {
  final PageController _pageController = PageController();
  if (!onBoardState.isLastPage) {
    _pageController.animateToPage(
      onBoardState.page + 1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOutSine,
    );
  } else {
    // print("done");
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Nie wieder ohne Impfpass!",
    description:
        "Mit dem digitalen Impfpass haben Sie ab jetzt überall ihren Impfpass und ihre negativen Testergebnisse mit dabei.",
    imgUrl: "assets/images/phone.png",
  ),
  const OnBoardModel(
    title: "Mit Familienübersicht!",
    description:
        "Um die Impfungen Ihrer Familie zu verwalten, haben Sie ab jetzt äußerst einfach die Möglichkeit dazu.",
    imgUrl: 'assets/images/graph.png',
  ),
  const OnBoardModel(
    title: "Die Daten für Ihren Impfpass haben nur Sie!",
    description:
        "Kein Datenschutz von Nöten, da die Daten nur auf Ihrem Endgerät gespeichert werden.",
    imgUrl: 'assets/images/weight.png',
  ),
];

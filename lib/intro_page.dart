import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz_flutter/home_page.dart';
//import 'package:intro_page_flutter/home_page.dart';
//import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introDate = GetStorage();
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset(
            'assets/brainhead.png',
            width: 150,
          ),
          title: 'Welcom To Brain Teaser',
          body: 'Quick brain teaser that can be fun to use on the go!',
          footer: const Text(' '),
          decoration: PageDecoration(
            pageColor: Colors.teal[200],
          )),
      PageViewModel(
          image: Image.asset(
            'assets/brainhead.png',
            width: 150,
          ),
          title: ' ',
          body:
              'Just try to navigate through the puzzles and solve them within a minute. If you are having a hard time solving it, just clock on the answer button.',
          footer: const Text(' '),
          // ignore: prefer_const_constructors
          decoration: PageDecoration(
            pageColor: Colors.teal[200],
          )),
      PageViewModel(
          image: Image.asset(
            'assets/brainhead.png',
            width: 150,
          ),
          title: ' ',
          body:
              'Easy questions are for beginner level while the hard ones are a bit more complicated.',
          footer: const Text('Good Luck!'),
          // ignore: prefer_const_constructors
          decoration: PageDecoration(
            pageColor: Colors.teal[200],
          )),
      /*  PageViewModel(
          image: Image.asset(
            'assets/happy_people.png',
            //  width: 200,
          ),
          title: 'Welcom To Brain Teaser',
          body: 'Live Demo Text 4 ',
          footer: const Text('Footer is Here...'),
          // ignore: prefer_const_constructors
          decoration: PageDecoration(
            pageColor: Colors.redAccent,
          )*/ //)
    ];
  }

  void _endWelcomingPage(context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    introDate.write('displayed', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showDoneButton: true,
        showSkipButton: true,
        showNextButton: true,
        next: Text('Next'),
        skip: Text('Skip'),
        done: Text('Done'),
        onSkip: () {
          _endWelcomingPage(context);
        },
        onDone: () {
          _endWelcomingPage(context);
        },
        pages: getPages(),
      ),
    );
  }
}

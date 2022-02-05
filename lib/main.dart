import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:quiz_flutter/easy_page.dart';
//import 'package:quiz_flutter/hard_page.dart';
import 'home_page.dart';
import 'intro_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final introDate = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    introDate.writeIfNull('displayed', false);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: introDate.read('displayed') ? HomePage() : IntroPage(),
    );
  }
}




















/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'LIGHT BRAIN TEASER '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
          child: Container(
        /* decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.4, 0.6, 0.8, 0.9],
          colors: [
            Colors.amber.shade200,
            Colors.lightGreen.shade200,
            Colors.lightBlue.shade200,
            Colors.orange.shade200,
            Colors.red.shade100,
          ],
        )),*/
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset(
                  'assets/brainhead.png',
                  width: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  color: CupertinoColors.destructiveRed,

                  // style: ElevatedButton.styleFrom(
                  //    fixedSize: const Size(130, 30), primary: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (Context) => const EasyPage()));
                  },
                  child: const Text(
                    'EASY PUZZLES',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 35,
              ),
              CupertinoButton(
                // style: ElevatedButton.styleFrom(
                //   fixedSize: const Size(130, 30),
                // primary: Colors.white,
                //),
                color: CupertinoColors.destructiveRed,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => const HardPage()));
                },
                child: const Text(
                  'HARD PUZZLES',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}*/

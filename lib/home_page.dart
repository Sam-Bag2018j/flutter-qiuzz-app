// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/easy_page.dart';
import 'package:quiz_flutter/hard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'LIGHT BRAIN TEASER',
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
                  color: CupertinoColors.systemGreen,

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
                color: CupertinoColors.systemGreen,
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
}

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:quiz_flutter/quiz.dart';

final _lightColors = [
  /* Colors.amber.shade200,
  Colors.lightGreen.shade200,
  Colors.lightBlue.shade200,
  Colors.orange.shade200,
  Colors.red.shade100,
  Colors.tealAccent.shade100*/
  Colors.blue.shade800,
  Colors.green.shade200
];

class EasyPage extends StatefulWidget {
  const EasyPage({Key? key}) : super(key: key);

  @override
  _EasyPageState createState() => _EasyPageState();
}

class _EasyPageState extends State<EasyPage> {
  List _items = [];
  String answerText = "View Answer";
  bool isPressed = false;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  static const txtstyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  Widget txtbuild(index) {
    return _items[index]["isShowing"]
        ? Text(
            _items[index]["answer"],
            style: txtstyle,
          )
        : Text(
            answerText,
            style: txtstyle,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Align(
            child: Text(
              'EASY PUZZLES',
              style: TextStyle(color: Colors.white),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_return,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Center(
              child: Scrollbar(
                  child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          color: _lightColors[index % _lightColors.length],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ExpansionTile(
                            title: Text(_items[index]["id"],
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ListTile(
                                      //dense: true,
                                      title: Text(_items[index]["name"],
                                          style: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      subtitle:
                                          Text(_items[index]["description"],
                                              style: const TextStyle(
                                                fontSize: 22.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: CupertinoButton(
                                        color: Colors.white,
                                        child: txtbuild(index),
                                        onPressed: () {
                                          setState(() {
                                            _items[index]["isShowing"] =
                                                !_items[index]["isShowing"];
                                          });
                                        },
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        );
                        // ],
                      }))),
        ));
  }
}

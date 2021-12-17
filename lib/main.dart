import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'touch popcat kish'),
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
  var img = "images/popcat1.png";
  AudioCache player = new AudioCache(prefix: "images/");
  AudioPlayer? oldPlayer = null;

  _tap() async {
    if (oldPlayer != null) {
      oldPlayer!.stop();
    }
    oldPlayer = await player.play('popcat sound.mp3', volume: 1);
    setState(() {
      if(img == "images/popcat1.png") {
        img = "images/popcat2.png";
      } else {
        print("2");
        img = "images/popcat1.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      child:Scaffold(
      body:  Container(
        width: double.infinity,
        height: double.infinity,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(img)
          ),
        )
      ),
    );
  }
}

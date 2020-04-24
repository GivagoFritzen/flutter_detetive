import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key key}) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  final _random = new Random();
  List<String> places = new List<String>();
  String place = "banco";
  Timer _timer;

  AudioCache player;

  @override
  void initState() {
    populatePlaces();

    AudioCache player = AudioCache();

    const period = const Duration(seconds: 5);
    _timer = new Timer.periodic(
      period,
      (Timer t) => {
        setState(() {
          place = places[_random.nextInt(places.length)];
          player.play('sounds/tv_no_signal.mp3');
        })
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  void populatePlaces() {
    places.add("banco");
    places.add("boate");
    places.add("cemiterio");
    places.add("estacao-trem");
    places.add("floricultura");
    places.add("hospital");
    places.add("hotel");
    places.add("mansao");
    places.add("praca-central");
    places.add("prefeitura");
    places.add("restaurante");
  }

  String randomNewPlace() {
    return places[_random.nextInt(places.length)];
  }

  BoxDecoration getDecorationBackground() {
    return BoxDecoration(
      color: Colors.black87,
      image: DecorationImage(
        image: AssetImage('assets/places/${place}.jpg'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.9), BlendMode.dstOut),
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: getDecorationBackground(),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Opacity(
          opacity: 0.05,
          child: Image(
            image: AssetImage('assets/background/tv-no-signal.gif'),
            fit: BoxFit.fill,
            height: 10,
          ),
        ),
      ),
    );
  }
}

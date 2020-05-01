import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key key}) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  final _random = new Random();
  List<String> places = new List<String>();
  List<String> events = ["call", "message"];
  String place = "banco";
  Timer _timer, _timerEvent;

  AudioCache player;

  @override
  void initState() {
    populatePlaces();
    Play();
    super.initState();
  }

  @override
  void dispose() {
    Pause();

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

  void RandomEvent() {
    int randomEvent = _random.nextInt(events.length);
    String nameEvent = events[randomEvent];

    Pause();

    if (nameEvent == "call")
      Navigator.pushNamed(
        context,
        '/${nameEvent}',
        arguments: {
          'personName': "widget.accuracy",
          'personImage': "dona-branca",
          'personColor': Colors.blueAccent,
        },
      );
    else
      Navigator.pushNamed(
        context,
        '/${nameEvent}',
        arguments: {
          'message': "widget.accuracy",
        },
      );
  }

  void Play() {
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

    /*
    const periodEvent = const Duration(seconds: 5);
    _timerEvent = new Timer.periodic(periodEvent, (Timer t) => {RandomEvent()});
     */
  }

  void Pause() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }

    if (_timerEvent != null) {
      _timerEvent.cancel();
      _timerEvent = null;
    }
  }

  void PauseGame() {
    if (_timer == null) // || _timerEvent == null)
      Play();
    else
      Pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: getDecorationBackground(),
            height: MediaQuery.of(context).size.height * .85,
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
          Container(
            child: Center(
              child: Text(
                "FIQUE ATENTO! A QUALQUER MOMENTO O CELULAR PODE TE DAR DICAS. NÃO SAIA DO APLICATIVO PARA NÃO PERDÊ-LAS",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: ColorsUtil.getDarkGreen(),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .1,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: RawMaterialButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/choicekiller'),
                      Pause(),
                    },
                    child: Text(
                      "SOLUCIONAR O CASO",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .1,
                  child: RawMaterialButton(
                    onPressed: () => PauseGame(),
                    child: Icon(
                      Icons.pause,
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.yellow,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .05,
          ),
        ],
      ),
    );
  }
}

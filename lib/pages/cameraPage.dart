import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/controllers/PlayerController.dart';
import 'package:flutterdetetive/scoped_models/main.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';
import 'package:scoped_model/scoped_model.dart';

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
  bool wasInitialized = false;

  AudioCache player;
  MainModel model;

  @override
  void initState() {
    populatePlaces();
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
    Pause();

    int randomEvent = _random.nextInt(events.length);
    String nameEvent = events[randomEvent];

    PlayerController randomPlayer = model.randomPlayerController();

    Navigator.pushNamed(
      context,
      '/${nameEvent}',
      arguments: {
        'playerController': randomPlayer,
      },
    );
  }

  void Play() {
    if (_timer != null || _timerEvent != null) return;

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

    int eventTime =
        GameManagersUtil.getTimeEventsInSeconds(model.players.length);
    Duration periodEvent = new Duration(seconds: eventTime);
    _timerEvent = new Timer.periodic(periodEvent, (Timer t) => {RandomEvent()});
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
    if (_timer == null || _timerEvent == null)
      Play();
    else
      Pause();
  }

  Widget showPlayerList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .65,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid.count(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              children: <Widget>[
                choicePlayerButton("Sargento BIGODE"),
                choicePlayerButton("Dona BRANCA"),
                choicePlayerButton("Senhor MARINHO"),
                choicePlayerButton("Tony GOURMET"),
                choicePlayerButton("Senhora ROSA"),
                choicePlayerButton("Dona VIOLETA"),
                choicePlayerButton("Sérgio SOTURNO"),
                choicePlayerButton("Mordomo James"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget choicePlayerButton(String player) {
    bool isActived = model.players.contains(player);

    return RawMaterialButton(
      onPressed: () => {
        if (isActived)
          {
            Pause(),
            model.updateCurrentPlayer(player),
            Navigator.pushNamed(context, '/choicekiller'),
          }
      },
      child: Container(
        width: double.infinity,
        color:
            isActived ? ColorsUtil.getMediumGreen() : ColorsUtil.getDarkGreen(),
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              color: isActived
                  ? GameManagersUtil.getColorByName(player)
                  : Colors.blueGrey,
              size: 15,
            ),
            SizedBox(width: 10),
            Flexible(
                child: Text(player, style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  Widget choicePlayerToDecide(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: ColorsUtil.getDarkGreen(),
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ANTES DE SOLUCIONAR O CRIME, SELECIONE ABAIXO O SEU JOGADOR.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    showPlayerList(),
                  ],
                ),
              ),
              ContinueButton(
                isActived: true,
                name: "Voltar",
                function: () => {
                  Play(),
                  Navigator.pop(context),
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget menuPause(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "JOGO PAUSADO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ContinueButton(
                isActived: true,
                name: "ENCERRAR JOGO",
                function: () => {
                  model.cleanAllInformation(),
                  Pause(),
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (Route route) => false,
                  ),
                },
              ),
              ContinueButton(
                isActived: true,
                name: "Voltar",
                function: () => {
                  Play(),
                  Navigator.pop(context),
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        this.model = model;
        if (!wasInitialized) {
          Play();
          wasInitialized = true;
        }

        return Column(
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
                        Pause(),
                        choicePlayerToDecide(context),
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
                        width: 1,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .1,
                    child: RawMaterialButton(
                      onPressed: () => {
                        Pause(),
                        menuPause(context),
                      },
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
        );
      }),
    );
  }
}

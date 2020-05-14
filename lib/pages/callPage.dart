import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/controllers/PlayerController.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/callButton.dart';
import 'package:flutterdetetive/widgets/playerIcon.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  bool _isInit = true;
  bool _isAccepted = false;
  PlayerController playerController;

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache player = AudioCache();

  Timer _timer;
  int seconds = 0;
  int minutes = 0;
  Widget personsWidget = Container();

  Widget buttonsWidget = Container();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _getData();
    }

    setState(() {
      _isInit = false;
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _getData() async {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    setState(() {
      playerController = data['playerController'];
    });
  }

  Icon getCursor(Color color) {
    return Icon(
      Icons.arrow_right,
      color: color,
      size: 50,
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        if (seconds >= 59) {
          seconds = 0;
          minutes += 1;
        } else {
          seconds += 1;
        }
      }),
    );
  }

  Widget showTimer() {
    if (_isAccepted) {
      return Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Text(
          "${showTwoDigits(minutes)}:${showTwoDigits(seconds)}",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Container();
  }

  String showTwoDigits(int number) {
    String twoDigits = "";

    if (number < 10) twoDigits = "0";

    twoDigits += number.toString();

    return twoDigits;
  }

  Widget getPersons() {
    if (!_isAccepted) {
      personsWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlayerIcon(
            isAnonymous: true,
            imageName: "anonymous",
            name: "Anônimo",
          ),
          getCursor(Colors.grey),
          getCursor(Colors.white),
          PlayerIcon(
            imageName: playerController.playerImage,
            name: playerController.name,
            playerColor: playerController.playerColor,
          ),
        ],
      );
    } else {
      personsWidget = Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 35),
          child: PlayerIcon(
            isAnonymous: true,
            imageName: "anonymous",
            name: "Anônimo",
          ),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          child: child,
          scale: animation,
        );
      },
      child: personsWidget,
    );
  }

  Widget getCallController() {
    if (!_isAccepted) {
      buttonsWidget = Padding(
        padding: EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CallButton(
              accepted: false,
              function: () => {
                setState(() {
                  _isAccepted = true;
                  startTimer();
                  playSound();
                })
              },
            ),
            CallButton(
              function: () => {
                Navigator.pushNamed(
                  context,
                  '/camera',
                )
              },
              answer: false,
            ),
          ],
        ),
      );
    } else {
      buttonsWidget = CallButton(
        accepted: true,
        function: () => {
          audioPlayer?.stop(),
          Navigator.pushNamed(
            context,
            '/camera',
          )
        },
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          child: child,
          scale: animation,
        );
      },
      child: buttonsWidget,
    );
  }

  void playSound() async {
    Random random = new Random();
    int randomNumber = random.nextInt(35) + 1;
    audioPlayer = await player.play('sounds/voices/voice${randomNumber}.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsUtil.getDarkGreen(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.green,
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  "RECEBENDO CHAMADA",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Spacer(),
            showTimer(),
            getPersons(),
            getCallController(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

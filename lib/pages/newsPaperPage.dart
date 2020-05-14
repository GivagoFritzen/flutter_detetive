import 'dart:async';

import 'package:flutter/material.dart';

class NewsPaperPage extends StatefulWidget {
  NewsPaperPage({Key key}) : super(key: key);

  @override
  NewsPaperPageState createState() => NewsPaperPageState();
}

class NewsPaperPageState extends State<NewsPaperPage> {
  bool _isInit = true;
  String personName, personImage;
  String placeName, placeImage;
  String weaponName, weaponImage;

  Timer _timer;
  int seconds = 0;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        seconds += 1;
        if (seconds >= 4) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (Route route) => false,
          );
        }
      }),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _getData();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  void _getData() async {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    setState(() {
      personName = data['personName'];
      personImage = data['personImage'];

      placeName = data['placeName'];
      placeImage = data['placeImage'];

      weaponName = data['weaponName'];
      weaponImage = data['weaponImage'];
    });
  }

  Widget getNewsPaperName() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Divider(color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "The",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .1,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "x x x x VHS",
                            style: TextStyle(fontSize: 5),
                          ),
                          Text(
                            "x x x x x x x x",
                            style: TextStyle(fontSize: 5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .05),
                Text(
                  "Daily News",
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black),
            Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget getCriminal(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerHeight = size.height * .17;
    final containerWidth = size.width * .27;

    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Container(
              height: containerHeight,
              width: containerWidth,
              decoration: getDecorationConfig(),
              child: Image(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                    'assets/person/${personImage.toLowerCase()}.png'),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "${personName.toUpperCase()} É O ASSASSINO",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .05),
                ),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: TextStyle(fontFamily: 'Redacted'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: TextStyle(fontFamily: 'Redacted'),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  BoxDecoration getDecorationConfig() {
    return BoxDecoration(
      color: Colors.black45,
      image: DecorationImage(
        image: AssetImage('assets/background/mugshot.jpg'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.9), BlendMode.dstOut),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getWeaponAndPlace() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "CALORS FORTUNA FOI MORTO COM A ${weaponName.toUpperCase()}, NO ${placeName.toUpperCase()}",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .05,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, consectetur adipiscing elit.",
                    style: TextStyle(fontFamily: 'Redacted'),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, consectetur adipiscing elit.",
                    style: TextStyle(fontFamily: 'Redacted'),
                  ),
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage(
                      'assets/weapons/${weaponImage.toLowerCase()}.jpg'),
                  height: 75,
                  width: 75,
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage(
                      'assets/places/${placeImage.toLowerCase()}.jpg'),
                  width: 75,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.hue),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/background-paper.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                getNewsPaperName(),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "CRIME SOLUCIONADO",
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                getCriminal(context),
                getWeaponAndPlace(),
                Divider(color: Colors.black),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lorem Ipsum1",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05,
                          fontFamily: 'Redacted',
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc diam enim, egestas et tristique sit amet.",
                              style: TextStyle(fontFamily: 'Redacted'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc diam enim, egestas et tristique sit amet.",
                              style: TextStyle(fontFamily: 'Redacted'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc diam enim, egestas et tristique sit amet.",
                              style: TextStyle(fontFamily: 'Redacted'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

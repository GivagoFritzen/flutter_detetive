import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterdetetive/pages/callPage.dart';
import 'package:flutterdetetive/pages/cameraPage.dart';
import 'package:flutterdetetive/pages/choiceCardsToPlayPage.dart';
import 'package:flutterdetetive/pages/homePage.dart';
import 'package:flutterdetetive/pages/investigationPage.dart';
import 'package:flutterdetetive/pages/messagePage.dart';
import 'package:flutterdetetive/pages/newsPaperPage.dart';
import 'package:flutterdetetive/pages/testimonyPage.dart';
import 'package:flutterdetetive/widgets/customAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget getBodyDefault(Widget page) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: new Color(0xff10201A),
          image: DecorationImage(
            image: AssetImage('assets/background/background.jpg'),
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstOut),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: page,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getBodyDefault(HomePage()),
      routes: {
        '/home': (context) => getBodyDefault(HomePage()),
        '/investigation': (context) => getBodyDefault(InvestigationPage()),
        '/call': (context) => CallPage(),
        '/message': (context) => MessagePage(),
        '/testimony': (context) => TestimonyPage(),
        '/newspaper': (context) => NewsPaperPage(),
        '/camera': (context) => CameraPage(),
        '/choice': (context) => ChoiceCardsToPlayPage(),
      },
    );
  }
}

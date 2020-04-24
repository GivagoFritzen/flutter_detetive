import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/choiceOptionsAba.dart';
import 'package:flutterdetetive/widgets/choicePlayerButton.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';

class ChoiceCardsToPlayPage extends StatefulWidget {
  ChoiceCardsToPlayPage({Key key}) : super(key: key);

  @override
  ChoiceCardsToPlayPageState createState() => ChoiceCardsToPlayPageState();
}

enum ChoiceCardsToPlayPageStep { Players, TypeOfChoice }

class ChoiceCardsToPlayPageState extends State<ChoiceCardsToPlayPage> {
  List<String> players = new List<String>();
  ChoiceCardsToPlayPageStep choiceCardsToPlayPageStep =
      ChoiceCardsToPlayPageStep.Players;

  Widget informationAboutScan() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.TypeOfChoice) {
      return Container(
        child: Text("teste"),
      );
    } else {
      return Container();
    }
  }

  Widget showAba() {
    Color backgroundColor = ColorsUtil.getLightGreen();

    String text = "";
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
      text = "ESCOLHA ENTRE 3 e 8 PARTICIPANTES PARA O JOGO";
    else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.TypeOfChoice) text = "CONFIGURANDO O CRIME";

    return ChoiceOptionsAba(
      text: text,
      backgroundColor: backgroundColor,
    );
  }

  Widget showAllPossiblePlayer() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players) {
      return Padding(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 15),
        child: Wrap(
          spacing: MediaQuery.of(context).size.width * .125,
          runSpacing: MediaQuery.of(context).size.width * .05,
          children: [
            ChoicePlayerButton(
              function: () => ControllerPlayers("Sargento BIGODE"),
              imageName: "sargento-bigode",
              name: "Sargento BIGODE",
              suspectColor: Colors.yellow,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Dona BRANCA"),
              imageName: "dona-branca",
              name: "Dona BRANCA",
              suspectColor: Colors.pinkAccent,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Senhor MARINHO"),
              imageName: "senhor-marinho",
              name: "Senhor MARINHO",
              suspectColor: Colors.lightGreen,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Tony GOURMET"),
              imageName: "tony-gourmet",
              name: "Tony GOURMET",
              suspectColor: Colors.deepOrangeAccent,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Senhora ROSA"),
              imageName: "senhora-rosa",
              name: "Senhora ROSA",
              suspectColor: Colors.red,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Dona VIOLETA"),
              imageName: "dona-violeta",
              name: "Dona VIOLETA",
              suspectColor: Colors.deepPurpleAccent,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Sérgio SOTURNO"),
              imageName: "sergio-soturno",
              name: "Sérgio SOTURNO",
              suspectColor: Colors.blueGrey,
            ),
            ChoicePlayerButton(
              function: () => ControllerPlayers("Mordomo James"),
              imageName: "mordomo-james",
              name: "Mordomo James",
              suspectColor: Colors.lightBlueAccent,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void ControllerPlayers(String player) {
    if (players.contains(player)) {
      setState(() {
        players.remove(player);
      });
    } else {
      setState(() {
        players.add(player);
      });
    }
  }

  Widget showExplication() {
    return Container(
      color: ColorsUtil.getLightGreen(),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: <Widget>[Text("teste")],
      ),
    );
  }

  Widget showButtons() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players) {
      return ContinueButton(
        isActived: players.length >= 3 ? true : false,
        name: "Continuar",
        function: () => {
          if (players.length >= 3)
            setState(() {
              choiceCardsToPlayPageStep =
                  ChoiceCardsToPlayPageStep.TypeOfChoice;
            })
        },
      );
    } else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.TypeOfChoice) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ContinueButton(
            isActived: true,
            name: "Continuar",
            function: () => {
              setState(() {
                choiceCardsToPlayPageStep =
                    ChoiceCardsToPlayPageStep.TypeOfChoice;
              })
            },
          ),
          SizedBox(width: 15),
          ContinueButton(
            isActived: true,
            name: "Continuar",
            function: () => {
              setState(() {
                choiceCardsToPlayPageStep =
                    ChoiceCardsToPlayPageStep.TypeOfChoice;
              })
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsUtil.getDarkGreen(),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            showAba(),
            showAllPossiblePlayer(),
            informationAboutScan(),
            showExplication(),
            showButtons(),
          ],
        ),
      ),
    );
  }
}

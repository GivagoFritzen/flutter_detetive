import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/enums/choiceCardsToPlayPageStep.dart';
import 'package:flutterdetetive/scoped_models/main.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/choiceOptionsAba.dart';
import 'package:flutterdetetive/widgets/choicePlayerButton.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';
import 'package:scoped_model/scoped_model.dart';

class ChoiceCardsToPlayPage extends StatefulWidget {
  ChoiceCardsToPlayPage({Key key}) : super(key: key);

  @override
  ChoiceCardsToPlayPageState createState() => ChoiceCardsToPlayPageState();
}

class ChoiceCardsToPlayPageState extends State<ChoiceCardsToPlayPage> {
  bool _isInit = true;
  bool choiceCardsToPlayPage = false;
  List<String> players = new List<String>();
  ChoiceCardsToPlayPageStep choiceCardsToPlayPageStep =
      ChoiceCardsToPlayPageStep.Players;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      try {
        final data =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        choiceCardsToPlayPage = data['choiceCardsToPlayPage'];
      } catch (ex) {}
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget informationAboutScan() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.TypeOfChoice) {
      return Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
          color: ColorsUtil.getMediumGreen(),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "ANTES DE COLOCAR AS CARTAS NO ENVELOPE 'REVELAÇÃO', VOCÊ PRECISA INDICAR QUAIS SÃO ELAS.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "ESCOLHA ESCANEAR PARA LER O QR CODE DAS CARTAS COM SUA CÂMERA OU SELECIONAR PARA ESCOLHER AS CARTAS QUE IRÃO REPRESENTAR CADA UM DOS ELEMENTOS.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 25),
                Container(
                  color: ColorsUtil.getLightGreen(),
                  width: MediaQuery.of(context).size.width * .7,
                  child: Column(
                    children: <Widget>[
                      informationAboutScanRow("CARTA DO ASSASSINO"),
                      informationAboutScanRow("CARTA DA ARMA"),
                      informationAboutScanRow("CARTA DO LOCAL"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else
      return Container();
  }

  Widget informationAboutScanRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width * .05),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Icon(
          Icons.stop,
          color: ColorsUtil.getDarkGreen(),
          size: 80,
        ),
      ],
    );
  }

  Widget showAba(MainModel model) {
    Color backgroundColor = ColorsUtil.getLightGreen();

    String text = "";
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
      text = "ESCOLHA ENTRE 3 e 8 PARTICIPANTES PARA O JOGO";
    else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.TypeOfChoice) text = "CONFIGURANDO O CRIME";

    return ChoiceOptionsAba(
      text: text,
      backgroundColor: backgroundColor,
      function: () => {
        setState(() {
          players.clear();
          model.updateListPlayers(new List<String>());
          choiceCardsToPlayPage = false;

          if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
            Navigator.pushNamed(context, '/home');
          else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.TypeOfChoice) {
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.Players;
          }
        })
      },
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
              function: () => controllerPlayers("Sargento BIGODE"),
              imageName: "sargento-bigode",
              name: "Sargento BIGODE",
              suspectColor: Colors.yellow,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Dona BRANCA"),
              imageName: "dona-branca",
              name: "Dona BRANCA",
              suspectColor: Colors.pinkAccent,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Senhor MARINHO"),
              imageName: "senhor-marinho",
              name: "Senhor MARINHO",
              suspectColor: Colors.lightGreen,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Tony GOURMET"),
              imageName: "tony-gourmet",
              name: "Tony GOURMET",
              suspectColor: Colors.deepOrangeAccent,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Senhora ROSA"),
              imageName: "senhora-rosa",
              name: "Senhora ROSA",
              suspectColor: Colors.red,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Dona VIOLETA"),
              imageName: "dona-violeta",
              name: "Dona VIOLETA",
              suspectColor: Colors.deepPurpleAccent,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Sérgio SOTURNO"),
              imageName: "sergio-soturno",
              name: "Sérgio SOTURNO",
              suspectColor: Colors.blueGrey,
            ),
            ChoicePlayerButton(
              function: () => controllerPlayers("Mordomo James"),
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

  void controllerPlayers(String player) {
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

  Widget showButtons(MainModel model) {
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
      return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ContinueButton(
              isActived: true,
              name: "Escanear",
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
              name: "Selecionar",
              function: () => {
                setState(() {
                  choiceCardsToPlayPageStep =
                      ChoiceCardsToPlayPageStep.ManualPlayers;
                  model.updateListPlayers(players);
                  Navigator.pushNamed(context, '/choicekiller');
                })
              },
            ),
          ],
        ),
      );
    } else
      return Container();
  }

  void UpdatePlayers(MainModel model) {
    if (choiceCardsToPlayPage) {
      players = model.players;
      choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.TypeOfChoice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        UpdatePlayers(model);

        return Container(
          color: ColorsUtil.getDarkGreen(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              showAba(model),
              showAllPossiblePlayer(),
              informationAboutScan(),
              showButtons(model),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/choiceKiller.dart';
import 'package:flutterdetetive/widgets/choiceOptionsAba.dart';
import 'package:flutterdetetive/widgets/choicePlayerButton.dart';
import 'package:flutterdetetive/widgets/choiceWeaponOrPlace.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';

class ChoiceCardsToPlayPage extends StatefulWidget {
  ChoiceCardsToPlayPage({Key key}) : super(key: key);

  @override
  ChoiceCardsToPlayPageState createState() => ChoiceCardsToPlayPageState();
}

enum ChoiceCardsToPlayPageStep {
  Players,
  TypeOfChoice,
  ManualPlayers,
  ManualWeapon,
  ManualPlace
}

class ChoiceCardsToPlayPageState extends State<ChoiceCardsToPlayPage> {
  List<String> players = new List<String>();
  String killer, crimeScene, murderWeapon;
  ChoiceCardsToPlayPageStep choiceCardsToPlayPageStep =
      ChoiceCardsToPlayPageStep.Players;

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

  Widget showAba() {
    Color backgroundColor = ColorsUtil.getLightGreen();
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualPlayers ||
        choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualWeapon ||
        choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualPlace)
      backgroundColor = Colors.red;

    String text = "";
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
      text = "ESCOLHA ENTRE 3 e 8 PARTICIPANTES PARA O JOGO";
    else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.TypeOfChoice)
      text = "CONFIGURANDO O CRIME";
    else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.ManualPlayers)
      text = "CARTA ASSASSINO";
    else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.ManualWeapon)
      text = "CARTA ARMA";
    else if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualPlace)
      text = "CARTA LOCAL";

    return ChoiceOptionsAba(
      text: text,
      backgroundColor: backgroundColor,
      function: () => {
        setState(() {
          if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
            Navigator.pushNamed(context, '/home');
          else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.TypeOfChoice) {
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.Players;
            players.clear();
          } else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.ManualPlayers)
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.TypeOfChoice;
          else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.ManualWeapon)
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.ManualPlayers;
          else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.ManualPlace)
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.ManualWeapon;
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

  Widget showKiller() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualPlayers) {
      return Expanded(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                children: <Widget>[
                  ChoiceKiller(
                    name: "Sargento BIGODE",
                    imageName: "sargento-bigode",
                    killerColor: Colors.yellow,
                    function: () => setState(() {
                      killer = "Sargento BIGODE";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Florista DONA BRANCA",
                    imageName: "dona-branca",
                    killerColor: Colors.white,
                    function: () => setState(() {
                      killer = "Florista DONA BRANCA";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Advogado SENHOR MARINHO",
                    imageName: "senhor-marinho",
                    killerColor: Colors.green,
                    function: () => setState(() {
                      killer = "Advogado SENHOR MARINHO";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Chef de Cozinha TONY GOURMET",
                    imageName: "tony-gourmet",
                    killerColor: Colors.brown,
                    function: () => setState(() {
                      killer = "Chef de Cozinha TONY GOURMET";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Dançarina Senhorita Rosa",
                    imageName: "senhora-rosa",
                    killerColor: Colors.red,
                    function: () => setState(() {
                      killer = "Dançarina Senhorita Rosa";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Médica DONA VIOLETA",
                    imageName: "dona-violeta",
                    killerColor: Colors.pink,
                    function: () => setState(() {
                      killer = "Médica DONA VIOLETA";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Coveiro SÉRGIO SOTURNO",
                    imageName: "sergio-soturno",
                    killerColor: Colors.blueGrey,
                    function: () => setState(() {
                      killer = "Coveiro SÉRGIO SOTURNO";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Mordomo JAMES",
                    imageName: "mordomo-james",
                    killerColor: Colors.blueAccent,
                    function: () => setState(() {
                      killer = "Mordomo JAMES";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget showWeapon() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualWeapon) {
      return Expanded(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverGrid.count(
                childAspectRatio: 1.2,
                crossAxisCount: 2,
                children: <Widget>[
                  ChoiceWeaponOrPlace(
                    name: "Arma Química",
                    imageName: "arma-quimica",
                    function: () => setState(() {
                      murderWeapon = "Arma Química";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Espingarda",
                    imageName: "espingarda",
                    function: () => setState(() {
                      murderWeapon = "Espingarda";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Faca",
                    imageName: "faca",
                    function: () => setState(() {
                      murderWeapon = "Faca";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Pá",
                    imageName: "pa",
                    function: () => setState(() {
                      murderWeapon = "Pá";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Pé de Cabra",
                    imageName: "pe-de-cabra",
                    function: () => setState(() {
                      murderWeapon = "Pé de Cabra";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Soco Inglês",
                    imageName: "soco-ingles",
                    function: () => setState(() {
                      murderWeapon = "Soco Inglês";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Tesoura",
                    imageName: "tesoura",
                    function: () => setState(() {
                      murderWeapon = "Tesoura";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Veneno",
                    imageName: "veneno",
                    function: () => setState(() {
                      murderWeapon = "Veneno";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget showPlace() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualPlace) {
      return Expanded(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverGrid.count(
                childAspectRatio: 1.2,
                crossAxisCount: 2,
                children: <Widget>[
                  ChoiceWeaponOrPlace(
                    name: "Banco",
                    imageName: "banco",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Banco";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Boate",
                    imageName: "boate",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Boate";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Cemitério",
                    imageName: "cemiterio",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Cemitério";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Estação de Trem",
                    imageName: "estacao-trem",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Estação de Trem";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Floricultura",
                    imageName: "floricultura",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Floricultura";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Hospital",
                    imageName: "hospital",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Hospital";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Hotel",
                    imageName: "hotel",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Hotel";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Mansão",
                    imageName: "mansao",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Mansão";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Praça Central",
                    imageName: "praca-central",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Praça Central";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Prefeitura",
                    imageName: "prefeitura",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Prefeitura";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Restaurante",
                    imageName: "restaurante",
                    isWeapon: false,
                    function: () => setState(() {
                      murderWeapon = "Restaurante";
                      Navigator.pushNamed(context, '/camera');
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container();
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
                })
              },
            ),
          ],
        ),
      );
    } else
      return Container();
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
            showKiller(),
            showWeapon(),
            showPlace(),
            showButtons(),
          ],
        ),
      ),
    );
  }
}

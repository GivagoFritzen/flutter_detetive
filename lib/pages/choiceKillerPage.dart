import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/enums/choiceCardsToPlayPageStep.dart';
import 'package:flutterdetetive/scoped_models/main.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/choiceKiller.dart';
import 'package:flutterdetetive/widgets/choiceOptionsAba.dart';
import 'package:flutterdetetive/widgets/choiceWeaponOrPlace.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';
import 'package:scoped_model/scoped_model.dart';

class ChoiceKillerPage extends StatefulWidget {
  ChoiceKillerPage({Key key}) : super(key: key);

  @override
  ChoiceKillerPageState createState() => ChoiceKillerPageState();
}

class ChoiceKillerPageState extends State<ChoiceKillerPage> {
  String killer, crimeScene, murderWeapon;
  bool isWrong = false;
  ChoiceCardsToPlayPageStep choiceCardsToPlayPageStep =
      ChoiceCardsToPlayPageStep.ManualPlayers;

  MainModel model;

  Widget showAba() {
    Color backgroundColor = Colors.red;

    String text = "";
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.ManualPlayers)
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
          if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.ManualPlayers) {
            if (model.crimeScene == "")
              Navigator.pushNamed(
                context,
                '/choice',
                arguments: {
                  'choiceCardsToPlayPage': true,
                },
              );
            else
              Navigator.pushNamed(
                context,
                '/camera',
              );
          } else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.ManualWeapon)
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.ManualPlayers;
          else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.ManualPlace)
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.ManualWeapon;
        })
      },
    );
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
                    function: () => savePlace("Banco"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Boate",
                    imageName: "boate",
                    isWeapon: false,
                    function: () => savePlace("Boate"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Cemitério",
                    imageName: "cemiterio",
                    isWeapon: false,
                    function: () => savePlace("Cemitério"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Estação de Trem",
                    imageName: "estacao-trem",
                    isWeapon: false,
                    function: () => savePlace("Estação de Trem"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Floricultura",
                    imageName: "floricultura",
                    isWeapon: false,
                    function: () => savePlace("Floricultura"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Hospital",
                    imageName: "hospital",
                    isWeapon: false,
                    function: () => savePlace("Hospital"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Hotel",
                    imageName: "hotel",
                    isWeapon: false,
                    function: () => savePlace("Hotel"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Mansão",
                    imageName: "mansao",
                    isWeapon: false,
                    function: () => savePlace("Mansão"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Praça Central",
                    imageName: "praca-central",
                    isWeapon: false,
                    function: () => savePlace("Praça Central"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Prefeitura",
                    imageName: "prefeitura",
                    isWeapon: false,
                    function: () => savePlace("Prefeitura"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Restaurante",
                    imageName: "restaurante",
                    isWeapon: false,
                    function: () => savePlace("Restaurante"),
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

  void savePlace(String place) {
    setState(() {
      crimeScene = place;
    });

    if (model.crimeScene == "") {
      saveKillerInformation();
      model.startGame();
      Navigator.pushNamedAndRemoveUntil(
          context, '/camera', (Route route) => false);
    } else
      answer();
  }

  void saveKillerInformation() {
    model.updateKiller(killer);
    model.updateMurderWeapon(murderWeapon);
    model.updateCrimeScene(crimeScene);
  }

  void answer() {
    if (killer != model.killer ||
        crimeScene != model.crimeScene ||
        murderWeapon != model.murderWeapon) {
      setState(() {
        isWrong = true;
      });
    } else
      Navigator.pushNamed(
        context,
        '/newspaper',
        arguments: {
          'personName': killer,
          'personImage': GameManagersUtil.getImageNameKiller(killer),
          'placeName': crimeScene,
          'placeImage': GameManagersUtil.getImageNameCrimeScene(crimeScene),
          'weaponName': murderWeapon,
          'weaponImage': GameManagersUtil.getImageNameWeapon(murderWeapon),
        },
      );
  }

  String getWrongText() {
    if (model.players.length == 0)
      return "Todos erraram, a polícia resolveu o crime";
    else
      return "O jogador ${model.currentPlayer} foi eliminado";
  }

  Widget wrongAnswer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Spacer(),
        Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "ERRADO!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
                Text(
                  getWrongText(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        ContinueButton(
          isActived: true,
          name: "CONTINUAR",
          function: () => {
            model.removerPlayer(),
            setState(() {
              isWrong = false;
            }),
            if (model.players.length == 0)
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (Route route) => false)
            else
              {Navigator.pushNamed(context, '/camera')}
          },
        ),
        Spacer(),
      ],
    );
  }

  Widget renderContent() {
    return Column(
      children: <Widget>[showAba(), showKiller(), showWeapon(), showPlace()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        this.model = model;

        return Container(
          color: ColorsUtil.getDarkGreen(),
          height: double.infinity,
          width: double.infinity,
          child: isWrong ? wrongAnswer() : renderContent(),
        );
      }),
    );
  }
}

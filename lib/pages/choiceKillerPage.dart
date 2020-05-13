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
                    killer: "Sargento BIGODE",
                    function: () => setState(() {
                      killer = "Sargento BIGODE";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Florista DONA BRANCA",
                    killer: "Dona BRANCA",
                    function: () => setState(() {
                      killer = "Dona BRANCA";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Advogado SENHOR MARINHO",
                    killer: "Senhor MARINHO",
                    function: () => setState(() {
                      killer = "Senhor MARINHO";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Chef de Cozinha TONY GOURMET",
                    killer: "Tony GOURMET",
                    function: () => setState(() {
                      killer = "Tony GOURMET";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Dançarina Senhorita Rosa",
                    killer: "Senhora ROSA",
                    function: () => setState(() {
                      killer = "Senhora ROSA";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Médica DONA VIOLETA",
                    killer: "Dona VIOLETA",
                    function: () => setState(() {
                      killer = "Dona VIOLETA";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Coveiro SÉRGIO SOTURNO",
                    killer: "Sérgio SOTURNO",
                    function: () => setState(() {
                      killer = "Sérgio SOTURNO";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualWeapon;
                    }),
                  ),
                  ChoiceKiller(
                    name: "Mordomo JAMES",
                    killer: "Mordomo James",
                    function: () => setState(() {
                      killer = "Mordomo James";
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
                    function: () => setState(() {
                      murderWeapon = "Arma Química";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Espingarda",
                    function: () => setState(() {
                      murderWeapon = "Espingarda";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Faca",
                    function: () => setState(() {
                      murderWeapon = "Faca";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Pá",
                    function: () => setState(() {
                      murderWeapon = "Pá";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Pé de Cabra",
                    function: () => setState(() {
                      murderWeapon = "Pé de Cabra";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Soco Inglês",
                    function: () => setState(() {
                      murderWeapon = "Soco Inglês";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Tesoura",
                    function: () => setState(() {
                      murderWeapon = "Tesoura";
                      choiceCardsToPlayPageStep =
                          ChoiceCardsToPlayPageStep.ManualPlace;
                    }),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Veneno",
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
                    isWeapon: false,
                    function: () => savePlace("Banco"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Boate",
                    isWeapon: false,
                    function: () => savePlace("Boate"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Cemitério",
                    isWeapon: false,
                    function: () => savePlace("Cemitério"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Estação de Trem",
                    isWeapon: false,
                    function: () => savePlace("Estação de Trem"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Floricultura",
                    isWeapon: false,
                    function: () => savePlace("Floricultura"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Hospital",
                    isWeapon: false,
                    function: () => savePlace("Hospital"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Hotel",
                    isWeapon: false,
                    function: () => savePlace("Hotel"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Mansão",
                    isWeapon: false,
                    function: () => savePlace("Mansão"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Praça Central",
                    isWeapon: false,
                    function: () => savePlace("Praça Central"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Prefeitura",
                    isWeapon: false,
                    function: () => savePlace("Prefeitura"),
                  ),
                  ChoiceWeaponOrPlace(
                    name: "Restaurante",
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

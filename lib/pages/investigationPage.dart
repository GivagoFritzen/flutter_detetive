import 'package:flutter/material.dart';
import 'package:flutterdetetive/widgets/investigationAba.dart';
import 'package:flutterdetetive/widgets/suspectPerson.dart';
import 'package:flutterdetetive/widgets/suspectWeaponOrPlace.dart';

class InvestigationPage extends StatefulWidget {
  @override
  _InvestigationPageState createState() => _InvestigationPageState();
}

class _InvestigationPageState extends State<InvestigationPage> {
  int currentPage = 1;

  void chancePage(int index) {
    setState(() => {currentPage = index});
  }

  Widget showList() {
    if (currentPage == 1)
      return showListSuspects();
    else if (currentPage == 2)
      return showListWeapons();
    else
      return showListPlaces();
  }

  Widget showListSuspects() {
    return Expanded(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              children: <Widget>[
                SuspectPerson(
                  imageName: "sargento-bigode",
                  name: "Sargento BIGODE",
                  suspectColor: Colors.yellow,
                ),
                SuspectPerson(
                  imageName: "dona-branca",
                  name: "Dona BRANCA",
                  suspectColor: Colors.pinkAccent,
                ),
                SuspectPerson(
                  imageName: "senhor-marinho",
                  name: "Senhor MARINHO",
                  suspectColor: Colors.lightGreen,
                ),
                SuspectPerson(
                  imageName: "tony-gourmet",
                  name: "Tony GOURMET",
                  suspectColor: Colors.deepOrangeAccent,
                ),
                SuspectPerson(
                  imageName: "senhora-rosa",
                  name: "Senhora ROSA",
                  suspectColor: Colors.red,
                ),
                SuspectPerson(
                  imageName: "dona-violeta",
                  name: "Dona VIOLETA",
                  suspectColor: Colors.deepPurpleAccent,
                ),
                SuspectPerson(
                  imageName: "sergio-soturno",
                  name: "Sérgio SOTURNO",
                  suspectColor: Colors.blueGrey,
                ),
                SuspectPerson(
                  imageName: "mordomo-james",
                  name: "Mordomo James",
                  suspectColor: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showListWeapons() {
    return Expanded(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              children: <Widget>[
                SuspectWeaponOrPlace(
                  imageName: "arma-quimica",
                  name: "Arma Química",
                ),
                SuspectWeaponOrPlace(
                  imageName: "espingarda",
                  name: "espingarda",
                ),
                SuspectWeaponOrPlace(
                  imageName: "faca",
                  name: "Faca",
                ),
                SuspectWeaponOrPlace(
                  imageName: "pa",
                  name: "Pá",
                ),
                SuspectWeaponOrPlace(
                  imageName: "pe-de-cabra",
                  name: "Pé de Cabra",
                ),
                SuspectWeaponOrPlace(
                  imageName: "soco-ingles",
                  name: "Soco Inglês",
                ),
                SuspectWeaponOrPlace(
                  imageName: "tesoura",
                  name: "Tesoura",
                ),
                SuspectWeaponOrPlace(
                  imageName: "veneno",
                  name: "Veneno",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showListPlaces() {
    return Expanded(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              children: <Widget>[
                SuspectWeaponOrPlace(
                  imageName: "banco",
                  name: "Banco",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "boate",
                  name: "Boate",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "cemiterio",
                  name: "Cemitério",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "estacao-trem",
                  name: "Estação de Trem",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "floricultura",
                  name: "Floricultura",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "hospital",
                  name: "Hospital",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "hotel",
                  name: "Hotel",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "mansao",
                  name: "Mansão",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "praca-central",
                  name: "Praça Central",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "prefeitura",
                  name: "Prefeitura",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  imageName: "restaurante",
                  name: "Restaurante",
                  isWeapon: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InvestigationAba(
            currentAba: currentPage,
            chancePageSupect: () => chancePage(1),
            chancePageWeapons: () => chancePage(2),
            chancePagePlaces: () => chancePage(3),
          ),
          showList(),
        ],
      ),
    );
  }
}

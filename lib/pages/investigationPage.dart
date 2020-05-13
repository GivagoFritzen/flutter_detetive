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
                SuspectWeaponOrPlace(name: "Arma Química"),
                SuspectWeaponOrPlace(name: "Espingarda"),
                SuspectWeaponOrPlace(name: "Faca"),
                SuspectWeaponOrPlace(name: "Pá"),
                SuspectWeaponOrPlace(name: "Pé de Cabra"),
                SuspectWeaponOrPlace(name: "Soco Inglês"),
                SuspectWeaponOrPlace(name: "Tesoura"),
                SuspectWeaponOrPlace(name: "Veneno"),
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
                  name: "Banco",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Boate",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Cemitério",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Estação de Trem",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Floricultura",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Hospital",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Hotel",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Mansão",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Praça Central",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
                  name: "Prefeitura",
                  isWeapon: false,
                ),
                SuspectWeaponOrPlace(
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

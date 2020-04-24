import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class InvestigationAba extends StatefulWidget {
  Function chancePageSupect, chancePageWeapons, chancePagePlaces;
  int currentAba = 1;

  InvestigationAba(
      {this.chancePageSupect,
      this.chancePageWeapons,
      this.chancePagePlaces,
      this.currentAba})
      : assert(chancePageSupect != null &&
            chancePageWeapons != null &&
            chancePagePlaces != null &&
            currentAba != null);

  @override
  _InvestigationAbaState createState() => _InvestigationAbaState();
}

class _InvestigationAbaState extends State<InvestigationAba> {
  Widget abaButton(String text, int index) {
    return RawMaterialButton(
      onPressed: () => {changePage(index)},
      child: Container(
        color: widget.currentAba == index
            ? ColorsUtil.getDarkGreen()
            : ColorsUtil.getLightGreen(),
        height: 50,
        width: MediaQuery.of(context).size.width * .333333333333333333333,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Function changePage(int index) {
    if (index == 1)
      return widget.chancePageSupect();
    else if (index == 2)
      return widget.chancePageWeapons();
    else
      return widget.chancePagePlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          abaButton("Suspeitos", 1),
          abaButton("Armas", 2),
          abaButton("Locais", 3),
        ],
      ),
    );
  }
}

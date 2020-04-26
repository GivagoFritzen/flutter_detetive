import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class ChoiceWeaponOrPlace extends StatelessWidget {
  String name, imageName;
  Function function;
  bool isWeapon;

  ChoiceWeaponOrPlace(
      {this.name, this.imageName, this.function, this.isWeapon = true})
      : assert(name != null && imageName != null && function != null);

  String getRoute() {
    if (isWeapon)
      return "weapons";
    else
      return "places";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: RawMaterialButton(
          onPressed: function,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/${getRoute()}/${imageName}.jpg'),
                  height: MediaQuery.of(context).size.width * 0.35,
                  fit: BoxFit.fill,
                ),
                Container(
                  color: ColorsUtil.getLightGreen(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(name),
                      ),
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

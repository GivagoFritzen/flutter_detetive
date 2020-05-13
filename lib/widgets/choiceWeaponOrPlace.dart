import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';

class ChoiceWeaponOrPlace extends StatelessWidget {
  String name;
  Function function;
  bool isWeapon;

  ChoiceWeaponOrPlace({this.name, this.function, this.isWeapon = true})
      : assert(name != null && function != null);

  String getRoute() {
    if (isWeapon)
      return 'assets/weapons/${GameManagersUtil.getImageNameWeapon(name)}.jpg';
    else
      return 'assets/places/${GameManagersUtil.getImageNameCrimeScene(name)}.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: RawMaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: function,
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage(getRoute()),
              height: double.infinity,
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    color: ColorsUtil.getLightGreen(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            name,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

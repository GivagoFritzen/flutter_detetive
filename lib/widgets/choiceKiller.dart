import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';

class ChoiceKiller extends StatelessWidget {
  String name, killer;
  Function function;

  ChoiceKiller({this.name, this.killer, this.function})
      : assert(name != null && killer != null && function != null);

  BoxDecoration getDecorationConfig() {
    return BoxDecoration(
      color: GameManagersUtil.getColorByName(killer),
      image: DecorationImage(
        image: AssetImage('assets/background/mugshot.jpg'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.8), BlendMode.dstOut),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: getDecorationConfig(),
        child: RawMaterialButton(
          onPressed: function,
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage(
                    'assets/person/${GameManagersUtil.getImageNameKiller(killer)}.png'),
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
                          SizedBox(width: 10),
                          Icon(
                            Icons.brightness_1,
                            color: GameManagersUtil.getColorByName(killer),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class ChoiceKiller extends StatelessWidget {
  String name, imageName;
  Color killerColor;
  Function function;

  ChoiceKiller({this.name, this.imageName, this.killerColor, this.function})
      : assert(name != null &&
            imageName != null &&
            killerColor != null &&
            function != null);

  BoxDecoration getDecorationConfig() {
    return BoxDecoration(
      color: killerColor,
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
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/person/${imageName}.png'),
                  height: MediaQuery.of(context).size.width * 0.35,
                  fit: BoxFit.fill,
                ),
                Container(
                  color: ColorsUtil.getLightGreen(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.brightness_1,
                        color: killerColor,
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

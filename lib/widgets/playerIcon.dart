import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class PlayerIcon extends StatelessWidget {
  bool isAnonymous;
  String imageName, name;
  Color playerColor;

  PlayerIcon(
      {this.imageName, this.playerColor, this.name, this.isAnonymous = false})
      : assert(imageName != null);

  BoxDecoration getDecorationConfig() {
    if (isAnonymous) {
      return BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: ColorsUtil.getLightGreen(),
          width: 3,
        ),
        shape: BoxShape.circle,
      );
    } else {
      return BoxDecoration(
        color: playerColor,
        border: Border.all(
          color: ColorsUtil.getLightGreen(),
          width: 3,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/background/mugshot.jpg'),
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.9), BlendMode.dstOut),
          fit: BoxFit.cover,
        ),
      );
    }
  }

  BoxDecoration getDecorationContent() {
    return BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/person/${imageName}.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getName() {
    if (name != "" && name != null) {
      return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          name.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    double size = 100;

    return Stack(
      overflow: Overflow.clip,
      children: [
        Column(
          children: <Widget>[
            Container(
              height: size,
              width: size,
              decoration: getDecorationConfig(),
              child: Container(
                height: size,
                width: size,
                decoration: getDecorationContent(),
              ),
            ),
            getName(),
          ],
        ),
      ],
    );
  }
}

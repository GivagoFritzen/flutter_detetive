import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';

class ChoicePlayerButton extends StatefulWidget {
  String name;
  Function function;

  ChoicePlayerButton({this.name, this.function})
      : assert(name != null && function != null);

  @override
  _ChoicePlayerButtonState createState() => _ChoicePlayerButtonState();
}

class _ChoicePlayerButtonState extends State<ChoicePlayerButton> {
  bool isSelected = false;

  BoxDecoration getPlayerBackground() {
    return BoxDecoration(
      color: getPlayerColor(),
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/background/mugshot.jpg'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.9), BlendMode.dstOut),
        fit: BoxFit.cover,
      ),
    );
  }

  BoxDecoration getPlayerImage() {
    return BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(
            'assets/person/${GameManagersUtil.getImageNameKiller(widget.name)}.png'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(getOpacity()), BlendMode.dstOut),
        fit: BoxFit.cover,
      ),
    );
  }

  double getOpacity() {
    if (isSelected)
      return 0;
    else
      return 0.6;
  }

  Widget renderImage(double size) {
    return Container(
      decoration: getPlayerBackground(),
      height: size,
      width: size,
      child: Container(
        decoration: getPlayerImage(),
      ),
    );
  }

  Color getPlayerColor() {
    if (isSelected)
      return GameManagersUtil.getColorByName(widget.name);
    else
      return Colors.black87;
  }

  Color getBackgroundColor() {
    if (isSelected)
      return ColorsUtil.getLightGreen();
    else
      return ColorsUtil.getLightGreen().withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double heightSize = 75;
    double widthSize = size.width / 2.75;

    return RawMaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => {
        widget.function(),
        setState(() {
          isSelected = !isSelected;
        }),
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            color: getBackgroundColor(),
            height: heightSize,
            width: widthSize,
            child: Padding(
              padding: EdgeInsets.only(left: widthSize / 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 15),
                  Flexible(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: getPlayerColor(),
                    size: 15,
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
          Positioned(
            left: -(widthSize / 4),
            child: renderImage(heightSize),
          ),
        ],
      ),
    );
  }
}

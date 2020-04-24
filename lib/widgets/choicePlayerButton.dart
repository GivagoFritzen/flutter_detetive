import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class ChoicePlayerButton extends StatefulWidget {
  String name, imageName;
  Color suspectColor;
  Function function;

  ChoicePlayerButton(
      {this.suspectColor, this.name, this.imageName, this.function})
      : assert(suspectColor != null &&
            name != null &&
            imageName != null &&
            function != null);

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
        image: AssetImage('assets/person/${widget.imageName}.png'),
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
      return widget.suspectColor;
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
    double size = 75;
    double widthSize = 150;

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
            height: size,
            width: widthSize,
            child: Padding(
              padding: EdgeInsets.only(left: widthSize / 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 15),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 12),
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
            left: -(widthSize / 5),
            child: renderImage(size),
          ),
        ],
      ),
    );
  }
}

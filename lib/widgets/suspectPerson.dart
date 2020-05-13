import 'package:flutter/material.dart';
import 'package:flutterdetetive/enums/suspectType.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/shapes/triangle.dart';

class SuspectPerson extends StatefulWidget {
  String name, imageName;
  Color suspectColor;
  SuspectType suspectType = SuspectType.noIdea;

  SuspectPerson({this.suspectColor, this.name, this.imageName})
      : assert(suspectColor != null && name != null && imageName != null);

  @override
  _SuspectPersonState createState() => _SuspectPersonState();
}

class _SuspectPersonState extends State<SuspectPerson> {
  BoxDecoration getDecorationConfig() {
    return BoxDecoration(
      color: widget.suspectColor,
      image: DecorationImage(
        image: AssetImage('assets/background/mugshot.jpg'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.9), BlendMode.dstOut),
        fit: BoxFit.cover,
      ),
    );
  }

  void changeSuspectType() {
    setState(() {
      switch (widget.suspectType) {
        case SuspectType.confirmed:
          widget.suspectType = SuspectType.not;
          break;
        case SuspectType.not:
          widget.suspectType = SuspectType.possible;
          break;
        case SuspectType.possible:
          widget.suspectType = SuspectType.noIdea;
          break;
        default:
          widget.suspectType = SuspectType.confirmed;
          break;
      }
    });
  }

  Color colorSuspectType() {
    switch (widget.suspectType) {
      case SuspectType.confirmed:
        return Colors.green;
      case SuspectType.not:
        return Colors.red;
      case SuspectType.possible:
      default:
        return Colors.yellow;
    }
  }

  IconData iconSuspectType() {
    switch (widget.suspectType) {
      case SuspectType.confirmed:
        return Icons.check;
      case SuspectType.not:
        return Icons.clear;
      case SuspectType.possible:
      default:
        return Icons.warning;
    }
  }

  Widget renderSuspectType() {
    if (widget.suspectType != SuspectType.noIdea) {
      return Positioned(
        right: 75,
        bottom: 45,
        child: CustomPaint(
          painter: DrawBottomTriangle(
            strokeColor: colorSuspectType(),
            height: 45,
            width: 75,
          ),
        ),
      );
    }

    return SizedBox.shrink();
  }

  Widget renderIconSuspectType() {
    if (widget.suspectType != SuspectType.noIdea) {
      return Positioned(
        right: 10,
        bottom: 5,
        child: Icon(
          iconSuspectType(),
          color: Colors.black,
          size: 20,
        ),
      );
    }

    return SizedBox.shrink();
  }

  Widget renderName(double height, double containerWidth) {
    return Container(
      color: ColorsUtil.getDarkGreen(),
      width: containerWidth,
      height: height,
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget renderTopTriangle() {
    double sizeHeight = 45;
    double sizeWidth = 90;

    return Positioned(
      left: 0,
      top: 0,
      child: CustomPaint(
        painter: DrawTopTriangle(
          strokeColor: ColorsUtil.getDarkGreen(),
          height: sizeHeight,
          width: sizeWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerHeight = size.height * .2;
    final containerWidth = size.width * .3;

    child:
    return RawMaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => changeSuspectType(),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: containerHeight,
            width: containerWidth,
            decoration: getDecorationConfig(),
            child: Image(
              image: AssetImage('assets/person/${widget.imageName}.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: renderName(containerHeight * .2, containerWidth),
          ),
          renderTopTriangle(),
          Positioned(
            left: 15 / 2,
            top: 15 / 2,
            child: Icon(
              Icons.brightness_1,
              color: widget.suspectColor,
              size: 15,
            ),
          ),
          renderSuspectType(),
          renderIconSuspectType(),
        ],
      ),
    );
  }
}

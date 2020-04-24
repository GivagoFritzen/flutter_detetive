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
    return Positioned(
      right: -32,
      bottom: 59,
      child: RotationTransition(
        turns: new AlwaysStoppedAnimation(135 / 360),
        child: CustomPaint(
          painter: DrawTriangle(
            strokeColor: colorSuspectType(),
            height: 45,
            width: 90,
          ),
        ),
      ),
    );
  }

  Widget renderName(double height) {
    return Container(
      color: ColorsUtil.getDarkGreen(),
      width: double.infinity,
      height: (height) * .2,
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget renderTopTriangle() {
    return Positioned(
      left: -33,
      top: 30,
      child: RotationTransition(
        turns: new AlwaysStoppedAnimation(-45 / 360),
        child: Stack(
          children: [
            CustomPaint(
              painter: DrawTriangle(
                strokeColor: ColorsUtil.getDarkGreen(),
                height: 45,
                width: 90,
              ),
            ),
          ],
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
      onPressed: () => changeSuspectType(),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: containerHeight,
            width: containerWidth,
            decoration: getDecorationConfig(),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/person/${widget.imageName}.png'),
                  fit: BoxFit.fill,
                  height: (containerHeight) * .8,
                ),
                renderName(containerHeight),
              ],
            ),
          ),
          renderTopTriangle(),
          Positioned(
            left: 10,
            top: 10,
            child: Icon(
              Icons.brightness_1,
              color: widget.suspectColor,
              size: 15,
            ),
          ),
          if (widget.suspectType != SuspectType.noIdea) renderSuspectType(),
          if (widget.suspectType != SuspectType.noIdea)
            Positioned(
              right: 5,
              bottom: 30,
              child: Icon(
                iconSuspectType(),
                color: Colors.black,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

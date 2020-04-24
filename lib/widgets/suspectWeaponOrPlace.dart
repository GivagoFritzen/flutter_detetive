import 'package:flutter/material.dart';
import 'package:flutterdetetive/enums/suspectType.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/shapes/triangle.dart';

class SuspectWeaponOrPlace extends StatefulWidget {
  String name, imageName;
  bool isWeapon;
  SuspectType suspectType = SuspectType.noIdea;

  SuspectWeaponOrPlace({this.name, this.imageName, this.isWeapon = true})
      : assert(name != null && imageName != null);

  @override
  _SuspectWeaponOrPlaceState createState() => _SuspectWeaponOrPlaceState();
}

class _SuspectWeaponOrPlaceState extends State<SuspectWeaponOrPlace> {
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
      bottom: 70,
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

  String getRoute() {
    if (widget.isWeapon)
      return "weapons";
    else
      return "places";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerHeight = size.height * .25;
    final containerWidth = size.width * .35;

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
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                      'assets/${getRoute()}/${widget.imageName}.jpg'),
                ),
                renderName(containerHeight),
              ],
            ),
          ),
          if (widget.suspectType != SuspectType.noIdea) renderSuspectType(),
          if (widget.suspectType != SuspectType.noIdea)
            Positioned(
              right: 5,
              bottom: 45,
              child: Icon(
                iconSuspectType(),
                color: Colors.black,
                size: 25,
              ),
            ),
        ],
      ),
    );
  }
}

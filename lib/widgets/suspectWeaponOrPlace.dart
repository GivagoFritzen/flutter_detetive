import 'package:flutter/material.dart';
import 'package:flutterdetetive/enums/suspectType.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';
import 'package:flutterdetetive/utils/shapes/triangle.dart';

class SuspectWeaponOrPlace extends StatefulWidget {
  String name;
  bool isWeapon;
  SuspectType suspectType = SuspectType.noIdea;

  SuspectWeaponOrPlace({this.name, this.isWeapon = true})
      : assert(name != null);

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
      return 'assets/weapons/${GameManagersUtil.getImageNameWeapon(widget.name)}.jpg';
    else
      return 'assets/places/${GameManagersUtil.getImageNameCrimeScene(widget.name)}.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerHeight = size.height * .25;
    final containerWidth = size.width * .35;

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
            child: Column(
              children: [
                Image(
                  image: AssetImage(getRoute()),
                ),
                renderName(containerHeight),
              ],
            ),
          ),
          renderSuspectType(),
          renderIconSuspectType(),
        ],
      ),
    );
  }
}

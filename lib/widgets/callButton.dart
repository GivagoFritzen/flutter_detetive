import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  bool answer;

  CallButton({this.answer = true});

  Animation<double> getRotation() {
    if (answer)
      return new AlwaysStoppedAnimation(-90 / 360);
    else
      return new AlwaysStoppedAnimation(0 / 360);
  }

  @override
  Widget build(BuildContext context) {
    double size = 55;

    return RawMaterialButton(
      onPressed: () => print("teste"),
      child: Container(
        height: size,
        width: size,
        decoration: new BoxDecoration(
          color: answer ? Colors.green : Colors.red,
          shape: BoxShape.circle,
        ),
        child: RotationTransition(
          turns: getRotation(),
          child: Icon(
            Icons.call_end,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}

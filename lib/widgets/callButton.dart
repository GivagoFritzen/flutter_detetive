import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  bool answer, accepted;
  Function function;

  CallButton({this.answer = true, this.function, this.accepted = false})
      : assert(function != null);

  Animation<double> getRotation() {
    if (answer)
      return new AlwaysStoppedAnimation(-90 / 360);
    else
      return new AlwaysStoppedAnimation(0 / 360);
  }

  Color getBackgroundColor() {
    if (!answer)
      return Colors.red;
    else if (answer && accepted)
      return Colors.grey;
    else
      return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    double size = 55;

    return RawMaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => {
        if (!answer || answer && !accepted) function(),
      },
      child: Container(
        height: size,
        width: size,
        decoration: new BoxDecoration(
          color: getBackgroundColor(),
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

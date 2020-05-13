import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  String name;
  bool isActived;
  Function function;
  double width, height;

  ContinueButton({this.name, this.function, this.isActived = false, this.width = 125, this.height = 35})
      : assert(function != null && name != null && isActived != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: function,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: this.isActived ? Colors.orangeAccent : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(name),
        ),
      ),
    );
  }
}

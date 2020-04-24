import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  String name;
  bool isActived;
  Function function;

  ContinueButton({this.name, this.function, this.isActived = false})
      : assert(function != null && name != null && isActived != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      child: Container(
        height: 35,
        width: 125,
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

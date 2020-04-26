import 'package:flutter/material.dart';

class ChoiceOptionsAba extends StatelessWidget {
  String text;
  Color backgroundColor;
  Function function;

  ChoiceOptionsAba({this.text, this.backgroundColor, this.function})
      : assert(text != null && backgroundColor != null && function != null);

  Widget buttonComeback(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .125,
      child: RawMaterialButton(
        onPressed: function,
        child: Container(
          color: Colors.yellow,
          width: MediaQuery.of(context).size.width * .125,
          height: double.infinity,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: MediaQuery.of(context).size.height * .07,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          buttonComeback(context),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

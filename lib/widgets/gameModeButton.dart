import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

class GameModeButton extends StatelessWidget {
  String text, image;
  Function nextPage;

  GameModeButton({this.text, this.nextPage, this.image})
      : assert(text != null && nextPage != null && image != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: RawMaterialButton(
        onPressed: nextPage,
        child: Container(
          color: ColorsUtil.getDarkGreen(),
          height: MediaQuery.of(context).size.height * .3,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage('assets/background/${image}.jpg'),
                width: double.infinity,
              ),
              Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

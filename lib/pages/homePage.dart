import 'package:flutter/material.dart';
import 'package:flutterdetetive/widgets/gameModeButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GameModeButton(
          image: "choice-1",
          nextPage: () => {
            Navigator.pushNamed(
              context,
              '/choice',
            ),
          },
          text:
              "o celular funciona como complemento do tabuleiro, auxiliando com dicas",
        ),
        GameModeButton(
          image: "choice-2",
          nextPage: () => {Navigator.pushNamed(context, '/investigation')},
          text:
              "use o celular como bloco de anotações, para marcar pistas e suspeitas",
        ),
      ],
    );
  }
}

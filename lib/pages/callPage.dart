import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/callButton.dart';
import 'package:flutterdetetive/widgets/playerIcon.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  bool _isInit = true;
  String personName, personImage;
  Color personColor;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _getData();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  void _getData() async {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    setState(() {
      personName = data['personName'];
      personImage = data['personImage'];
      personColor = data['personColor'];
    });
  }

  Icon getCursor(Color color) {
    return Icon(
      Icons.arrow_right,
      color: color,
      size: 50,
    );
  }

  Widget getPersons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlayerIcon(
          isAnonymous: true,
          imageName: "anonymous",
          name: "Anônimo",
        ),
        getCursor(Colors.grey),
        getCursor(Colors.white),
        PlayerIcon(
          imageName: personImage,
          name: personName,
          playerColor: personColor,
        ),
      ],
    );
  }

  Widget getCallController() {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CallButton(
            function: () => print("object"),
          ),
          CallButton(
            function: () => {
              Navigator.pushNamed(
                context,
                '/camera',
              )
            },
            answer: false,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtil.getDarkGreen(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: ColorsUtil.getLightGreen(),
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(
                "RECEBENDO CHAMADA",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Spacer(),
          getPersons(),
          getCallController(),
          Spacer(),
        ],
      ),
    );
  }
}

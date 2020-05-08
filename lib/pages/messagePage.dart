import 'package:flutter/material.dart';
import 'package:flutterdetetive/controllers/PlayerController.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';
import 'package:flutterdetetive/widgets/playerIcon.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  bool _isInit = true;
  bool showMessage = false;
  PlayerController playerController;

  Widget messageWidget = Container();

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
      playerController = data['playerController'];
    });
  }

  Widget getMessage() {
    return Padding(
      padding: EdgeInsets.only(top: 35),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.width * 0.35,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                playerController.getAndRemoveOneTip(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Positioned(
            left: -15,
            top: -55,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
              size: 100,
            ),
          ),
        ],
      ),
    );
  }

  Icon getCursor(Color color) {
    return Icon(
      Icons.arrow_right,
      color: color,
      size: 50,
    );
  }

  Widget renderButtons() {
    double size = 55;

    if (!showMessage) {
      return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => {
                setState(() {
                  showMessage = true;
                  messageWidget = getMessage();
                }),
              },
              child: Container(
                height: size,
                width: size,
                decoration: new BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            RawMaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.pushNamed(
                context,
                '/camera',
              ),
              child: Container(
                height: size,
                width: size,
                decoration: new BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: ContinueButton(
        isActived: true,
        name: "Continuar",
        function: () => Navigator.pushNamed(
          context,
          '/camera',
        ),
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
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Anônimo',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              getCursor(Colors.grey),
              getCursor(Colors.white),
              PlayerIcon(
                name: playerController.name,
                imageName: playerController.playerImage,
                playerColor: playerController.playerColor,
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                child: child,
                scale: animation,
              );
            },
            child: messageWidget,
          ),
          renderButtons(),
          Spacer(),
        ],
      ),
    );
  }
}

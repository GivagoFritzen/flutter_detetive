import 'package:flutter/material.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/playerIcon.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  bool _isInit = true;
  String message;

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
      message = data['message'];
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
                message,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtil.getDarkGreen(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.message,
                color: Colors.white,
                size: 85,
              ),
              PlayerIcon(
                isAnonymous: true,
                imageName: "anonymous",
              ),
            ],
          ),
          getMessage(),
          Spacer(),
        ],
      ),
    );
  }
}

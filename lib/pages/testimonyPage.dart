import 'package:flutter/material.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';

class TestimonyPage extends StatefulWidget {
  TestimonyPage({Key key}) : super(key: key);

  @override
  TestimonyPageState createState() => TestimonyPageState();
}

class TestimonyPageState extends State<TestimonyPage> {
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

  BoxDecoration getDecorationConfig() {
    return BoxDecoration(
      color: Colors.blueGrey,
      image: DecorationImage(
        image: AssetImage('assets/background/testimony-background.png'),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2), BlendMode.dstOut),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget rec() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 25, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              color: Colors.red,
              size: 5,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Rec",
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getDecorationConfig(),
      child: Column(
        children: <Widget>[
          rec(),
          Spacer(),
          Container(
            color: Colors.black54,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: ContinueButton(
              isActived: true,
              name: "CONTINUAR",
              function: () => Navigator.pushNamed(
                context,
                '/camera',
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

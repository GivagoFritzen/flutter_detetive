import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const CustomAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Detetive",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.yellow,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

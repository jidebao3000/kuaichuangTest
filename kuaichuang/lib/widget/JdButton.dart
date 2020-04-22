import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

class JdButton extends StatelessWidget {

  final Color color;
  final IconData icon;
  final String text;
  final Object cb;

  JdButton(
      {Key key, this.color = null, this.text = "", this.cb = null, this.icon = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(icon, size: ScreenAdapter.size(90), color: color),
            onPressed: cb),
        Container(
          margin: EdgeInsets.only(top: 10,left: 10),
          child: Text(text, style: TextStyle(fontSize: 12),),)
      ],
    );
  }
}

import 'package:flutter/material.dart';
///圆形带文字按钮
class IconTextButton extends StatelessWidget{
  final String imageUrl;
  final String string;
  final Object op;

  const IconTextButton({Key key, this.imageUrl, this.string, this.op}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.network(imageUrl,fit: BoxFit.fill,),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(string),
          )
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';

///我的页面按钮
class UserBtn extends StatelessWidget{
  final Object op;
  final IconData iconData;
  final String string;
  final Color color;

  const UserBtn({Key key, this.op, this.iconData, this.string, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child: Container(
        alignment: Alignment.center,

        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(iconData,size: 20,color: color,),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10),
                  child: Text(string,style: TextStyle(fontSize: 12),),
                )
              ],
            ),
            Positioned(
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(Icons.chevron_right,size: 40,color: Colors.grey,),
                ))
          ],
        ),
      ),
    );
  }


}
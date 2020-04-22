import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';


///热门推荐及更多
class HotAndMore extends StatelessWidget{
  final String string;
  final Object op;

  const HotAndMore({Key key, this.string, this.op}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          width: ScreenAdapter.getScreenWidth(),
          child: Text(string,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        Positioned(
            right: 10,
            width: 50,
            child:InkWell(
              onTap:op,
              child:  Row(
                children: <Widget>[
                   Text('更多',style: TextStyle(color: Colors.grey,fontSize: 12,),),
                  Icon(Icons.chevron_right,color: Colors.grey,)
                ],
              ),
            )
        )
      ],
    );
  }

}
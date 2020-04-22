import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

///热门产品按钮
class HotProductButton extends StatelessWidget{
  final String imageUrl;
  final String btnName;
  final Object op;

  const HotProductButton({Key key, this.imageUrl, this.btnName, this.op}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = ScreenAdapter.getScreenWidth();
    // TODO: implement build
    return InkWell(
      onTap: op,
      child:Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: (screenWidth-40)/3,
              height: (screenWidth-40)/3,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(
                  image: NetworkImage(imageUrl),fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              child: Text(btnName,style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }

}
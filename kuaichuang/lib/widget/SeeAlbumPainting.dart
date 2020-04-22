import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

///首页看画册详情页
class SeeAlbumPainting extends StatelessWidget{
  final String imageUrl;
  final String productText;
  final String companyName;
  final String iconUrl;
  final Object op;

  const SeeAlbumPainting({Key key, this.productText, this.companyName, this.iconUrl, this.imageUrl,this.op}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child: Container(
        width: (ScreenAdapter.getScreenWidth()-40)/2,
        height: ScreenAdapter.height(600),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300],width: 1),
          borderRadius: BorderRadius.circular(5),
          ///主要用来设置阴影设置
          boxShadow: [
            BoxShadow(
              offset: Offset(0,10),
              blurRadius: 5,
              spreadRadius: -3,
              color: Color.fromARGB(80, 0, 0, 0),
            ),
          ],
        ),
        child:Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight:Radius.circular(5) )
                  ) ,
                  height: ScreenAdapter.height(500),
                child: Image.network(imageUrl,fit: BoxFit.fill,),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(productText,style: TextStyle(color: Colors.white,fontSize: 14),))
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10,top: 10),
                  width: 30,
                  height:30,
                child: Image.network(iconUrl),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,top: 10),
                  child:Text(companyName,style: TextStyle(fontSize: 14),),
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }


}
import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';


///精品画册ListView下图片按钮
 class BoutiqueButton extends StatelessWidget{
   final String imageUrl;
   final String productText;
   final String companyName;
   final String iconUrl;
   final Object op;

  const BoutiqueButton({Key key, this.productText, this.companyName, this.iconUrl, this.imageUrl,this.op}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child: Container(
        margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
        width: ScreenAdapter.width(260),
        height: ScreenAdapter.height(500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          //主要用来设置阴影设置
          boxShadow: [
            BoxShadow(
              offset: Offset(0,10),
              blurRadius: 5,
              spreadRadius: -3,
              color: Color.fromARGB(50, 0, 0, 0),
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
                  height: ScreenAdapter.height(420),
                child:ClipRRect(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5)),
//                  child: Image.network(imageUrl,fit: BoxFit.fill,),
                   child: FadeInImage.assetNetwork(placeholder:'images/bg.jpg' , image: imageUrl,fit: BoxFit.fill,),
                ),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(productText,style: TextStyle(color: Colors.white,fontSize: 12),))
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10,top: 5),
                  width: ScreenAdapter.width(50),
                  height: ScreenAdapter.width(50),
                child: Image.network(iconUrl),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,top: 5),
                  child:Text(companyName,style: TextStyle(fontSize: 10),),
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }

 }
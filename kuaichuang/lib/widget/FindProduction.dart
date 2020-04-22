import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

///首页找产品详情页
class FindProduction extends StatelessWidget{
  final String imageUrl;
  final String productName;
  final String companyName;
  final Object op;
  final Object ellipsisOp;

  const FindProduction({Key key, this.imageUrl, this.productName, this.companyName, this.op, this.ellipsisOp}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child:  Container(
        width: (ScreenAdapter.getScreenWidth()-30)/2,
        height: 300,
        margin: EdgeInsets.only(left: 10,top: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
          boxShadow: [
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 5,
            spreadRadius: -3,
            color: Color.fromARGB(80, 0, 0, 0),
          ),
        ],),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: (ScreenAdapter.getScreenWidth()-30)/2,
              height: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight:Radius.circular(5)),color: Colors.blue),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5)),
                child: Image.network(imageUrl,fit: BoxFit.fill,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,left: 10),
              child: Text(productName,style: TextStyle(fontWeight: FontWeight.w700),maxLines: 2,),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10,left: 10),
                  width:(ScreenAdapter.getScreenWidth()-30)/2-60,
                  child: Text(companyName,style: TextStyle(fontSize: 12,color: Colors.grey),),
                ),
                IconButton(icon: Icon(Icons.remove), onPressed: ellipsisOp)

              ],
            )
          ],
        ),
      ),
    );
  }

}
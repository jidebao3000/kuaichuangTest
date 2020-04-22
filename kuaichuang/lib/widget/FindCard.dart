import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

///找名片详情
class FindCard extends StatelessWidget{
  final String imageUrl;
  final String name;
  final String company;
  final String position;
  final Object op;

  const FindCard({Key key, this.imageUrl, this.name, this.company, this.position, this.op}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child: Container(
        width: (ScreenAdapter.getScreenWidth()-30)/2,
        height:240,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.grey[400]),borderRadius: BorderRadius.circular(10),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(top: 30,bottom: 30),
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl,fit: BoxFit.fill,),
              ),
            ),
            Container(
              child: Text(name,style: TextStyle(fontWeight:FontWeight.w600 ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(position,style: TextStyle(fontSize: 10),),
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 10),
              child: Text(company,style: TextStyle(fontSize: 10,),maxLines: 1,),
            ),
          ],
        ) ,
      ),
    );
  }


}
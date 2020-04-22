import 'package:flutter/material.dart';
///热门名片
class HotCardBtn extends StatelessWidget{
  final String imageUrl;
  final String name;
  final String company;
  final String position;
  final Object op;

  const HotCardBtn({Key key, this.imageUrl, this.name, this.company, this.position, this.op}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: op,
      child: Container(
        margin: EdgeInsets.only(left: 3,right: 3,bottom: 5),
        width: 120,
        height:180,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1,color: Colors.grey[400]),borderRadius: BorderRadius.circular(10),
            boxShadow: [
            BoxShadow(
            offset: Offset(0,10),
        blurRadius: 5,
        spreadRadius: -3,
        color: Color.fromARGB(80, 0, 0, 0),
      ),]
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(top: 20,bottom: 15),
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl,fit: BoxFit.fill,),
              ),
            ),
            Container(
              child: Text(name,style: TextStyle(fontWeight:FontWeight.w600 ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(position,style: TextStyle(fontSize: 10),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,left: 10),
              child: Text(company,style: TextStyle(fontSize: 10,),maxLines: 1,),
            ),
          ],
        ) ,
      ),
    );
  }

}
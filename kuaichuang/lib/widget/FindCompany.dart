import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
///首页找企业详情
///根据后台数据结构还需更改
class FindCompany extends StatelessWidget{
  final Object op;
  final Object opMore;
  final List list;
  final String imageUrl;
  final String companyName;
//  List <Widget>imageList=[];
  const FindCompany({Key key, this.imageUrl, this.companyName, this.op, this.list, this.opMore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Divider(height: 1,color: Colors.grey[400],),
        Stack(
          children: <Widget>[
            InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width:40,
                    height:40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.only(left: 10,top: 20,right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(imageUrl,fit: BoxFit.fill,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(companyName,style: TextStyle(color: Colors.blue),),
                  )
                ],
              ),
            ),
            Positioned(
                right: 10,
                top: 15,
                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: opMore))
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          width: ScreenAdapter.getScreenWidth(),
          height: 110,
          child:  Row(
            children: <Widget>[
              InkWell(
                onTap: op,
                child:Container(
                  width:(ScreenAdapter.getScreenWidth()-35)/4 ,
                  height: (ScreenAdapter.getScreenWidth()-35)/4,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),image: DecorationImage(
                      image: NetworkImage(list[0],),fit: BoxFit.fill
                  )),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),
              InkWell(
                onTap: op,
                child: Container(
                  width:(ScreenAdapter.getScreenWidth()-35)/4 ,
                  height: (ScreenAdapter.getScreenWidth()-35)/4,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),image: DecorationImage(
                      image: NetworkImage(list[1],),fit: BoxFit.fill
                  )),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),
              InkWell(
                onTap: op,
                child: Container(
                  width:(ScreenAdapter.getScreenWidth()-35)/4 ,
                  height: (ScreenAdapter.getScreenWidth()-35)/4,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),image: DecorationImage(
                      image: NetworkImage(list[2],),fit: BoxFit.fill
                  )),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),
              InkWell(
                  onTap: opMore,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Container(
                        width:(ScreenAdapter.getScreenWidth()-35)/4 ,
                        height: (ScreenAdapter.getScreenWidth()-35)/4,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),image: DecorationImage(
                            image: NetworkImage(list[3],),fit: BoxFit.fill
                        )),
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Container(
                        width:(ScreenAdapter.getScreenWidth()-35)/4 ,
                        height: (ScreenAdapter.getScreenWidth()-35)/4,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0x70000000)),
                        margin: EdgeInsets.only(left: 5),
                        child: Center(
                          child: Text('更多',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          )
        )
      ],
    );
  }
//  _imageList(List list){
//    for(int i=0;i<list.length;i++){
//      Widget content;
//      content=Container(
//        width:(ScreenAdapter.getScreenWidth()-35)/4 ,
//        height: (ScreenAdapter.getScreenWidth()-35)/4,
//        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//        margin: EdgeInsets.only(left: 5),
//        child:ClipRRect(
//          borderRadius: BorderRadius.circular(5),
//          child: Image.network(list[i],fit: BoxFit.fill,),
//        ) ,
//      );
////      imageList.add(content);
//    }
//  }
}
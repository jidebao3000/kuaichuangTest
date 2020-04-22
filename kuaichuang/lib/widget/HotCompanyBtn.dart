import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

///首页热门企业按钮

class HotCompanyBtn extends StatelessWidget{
  final String imageUrl;
  final String companyName;
  final List list;
  final Object op;
  final Object opMore;
  const HotCompanyBtn({Key key, this.imageUrl, this.companyName, this.list, this.op, this.opMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: opMore,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    child: Image.network(imageUrl,fit: BoxFit.fill,),
                  ),
                ),
                InkWell(
                  onTap: opMore,
                  child:  Container(
                    child: Text(companyName,style: TextStyle(color:Colors.blue),),
                  ),
                )

              ],
            ),
            Positioned(
                right: 0,
                top: 10,
                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: opMore)
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
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
      ],
    );
  }


}
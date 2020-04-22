
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/BottomSheet.dart';
import '../services/ScreenAdapter.dart';


class CardDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardDetailsState();
  }
}

class _CardDetailsState extends State<CardDetails> {
//  final TelephoneService _service = locator<TelephoneService>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: Text('名片详情'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){BottomSheetWidget.bottom(context);})
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: ScreenAdapter.getScreenWidth(),
            height: ScreenAdapter.getScreenHeight(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      margin:EdgeInsets.only(left: ScreenAdapter.width(20)),
                      width: ScreenAdapter.getScreenWidth()-ScreenAdapter.width(40),
                      height: 200,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey[200]),borderRadius: BorderRadius.circular(10)),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(child: Text('姚娇',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 25),
                            child: Text('市场运营',style: TextStyle(fontSize: 12,color: Colors.grey),),),
                          Container(child: Row(
                            children: <Widget>[
                              Icon(Icons.phone,color: Colors.blue,size: 18,),
                              InkWell(
                                onTap: ()async{
                                    ///打电话
                                    const url = 'tel:15041199641';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                ///打开浏览器
//                                  const url = 'https://github.com';
//                                  if (await canLaunch(url)) {
//                                    await launch(url);
//                                  } else {
//                                    throw 'Could not launch $url';
//                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('15041199641',style: TextStyle(color: Colors.blue,fontSize: 12,
                                      decoration: TextDecoration.underline,decorationColor: Colors.blue),),),
                              )
                            ],
                          ),),
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                            children: <Widget>[
                              Icon(Icons.email,color: Colors.blue,size: 18,),
                              Container(margin: EdgeInsets.only(left: 10),child: Text('562596994@qq.com',style: TextStyle(color: Colors.grey,fontSize: 12),),),

                            ],
                          ),),
                          Container(child: Row(
                            children: <Widget>[
                              Icon(Icons.business,color: Colors.blue,size: 18,),
                              Container(margin: EdgeInsets.only(left: 10),child: Text('大连神奇视角网络科技有限公司',style: TextStyle(color: Colors.grey,fontSize: 12),),),
                            ],
                          ),)
                        ],
                      ) ,
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: InkWell(

                          onTap: (){
                            Navigator.push(context, PageRouteBuilder(
                                pageBuilder: (BuildContext context, Animation animation,
                                    Animation secondaryAnimation) {
                                  return new FadeTransition(
                                    opacity: animation,
                                    child:  CardPhotoToBig(),
                                  );
                                })
                            );
                          },
                          child: Hero(
                            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                            child: Container(
                            width: 60,
                            height: 60,
                            child: ClipRRect(child: Image.network(
                              'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
                              borderRadius: BorderRadius.circular(5),),
                          ),
                        )))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 10,left: 30),
                  child: Text("他的企业名片",style: TextStyle(color: Colors.grey),),
                ),
                Container(
                  margin:EdgeInsets.only(left: ScreenAdapter.width(20)),
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  width: ScreenAdapter.getScreenWidth()-ScreenAdapter.width(40),
                  height: 180,
                  decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey[200]),borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 30,
                            height: 30,
                            child: ClipRRect(child: Image.network(
                              'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
                              borderRadius: BorderRadius.circular(150),),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(child: Text('大连神奇视角网络科技有限公司',style: TextStyle(fontSize: 14,color: Colors.blue),),),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('IT/互联网',style: TextStyle(fontSize: 12,color: Colors.grey),),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap:null,
                            child: Container(
                              width: 50,
                              height:50,
                              child: ClipRRect(child: Image.network(
                                'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
                                borderRadius: BorderRadius.circular(5),),
                            ),
                          ),
                          InkWell(
                            onTap:null,
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 50,
                              height:50,
                              child: ClipRRect(child: Image.network(
                                'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
                                borderRadius: BorderRadius.circular(5),),
                            ),
                          ),
                          InkWell(
                            onTap:null,
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 50,
                              height:50,
                              child: ClipRRect(child: Image.network(
                                'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
                                borderRadius: BorderRadius.circular(5),),
                            ),
                          ),InkWell(
                            onTap:null,
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 50,
                              height:50,
                              child: ClipRRect(child: Image.network(
                                'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
                                borderRadius: BorderRadius.circular(5),),
                            ),
                          ),
                          InkWell(
                              onTap: null,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: <Widget>[
                                  Container(
                                    width:50,
                                    height:50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),image: DecorationImage(
                                        image: NetworkImage( 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',),fit: BoxFit.fill
                                    )),
                                    margin: EdgeInsets.only(left: 10),
                                  ),
                                  Container(
                                    width:50,
                                    height: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0x70000000)),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Center(
                                      child: Text('更多',style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on,size: 14,),
                          Container(margin:EdgeInsets.only(left: 10),child: Text('辽宁省大连市高新园区火炬路创业大厦1101',style: TextStyle(fontSize: 12),),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: ()=> Navigator.pushNamed(context, '/logIn'),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey[400])),
                      width: ScreenAdapter.getScreenWidth()/3,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.message),
                          Container(child: Text('发私信'),)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=> Navigator.pushNamed(context, '/logIn'),
                    child: Container(
                      width: ScreenAdapter.getScreenWidth()/3*2,
                      height: 50,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person_add,color: Colors.white),
                          Container(child: Text('加联系',style: TextStyle(color: Colors.white),),)
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],

      ),
    );
  }
}
class CardPhotoToBig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pop(context);},
      child: Container(
        width: ScreenAdapter.getScreenWidth(),
        height: ScreenAdapter.getScreenHeight(),
        child: Hero(
          tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.network('https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
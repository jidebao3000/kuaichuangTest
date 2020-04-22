import 'package:flutter/material.dart';
import '../icons/iconfont.dart';
import '../services/ScreenAdapter.dart';
///登录页面
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(

      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
            image: NetworkImage(  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg'),fit: BoxFit.fill)),
        child:Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.getScreenHeight(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 200),
                      height: 40,
                      width: ScreenAdapter.getScreenWidth()-80,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(150)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.phone_android,color: Colors.white,),
                          Container(
                            child: Text("手机号登录/注册",style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      child:Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: ScreenAdapter.getScreenWidth()-80,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(150),border: Border.all(color: Colors.grey[200],width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(IconFont.icon_weixin),
                            Container(
                              child: Text("微信登录"),
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                child: Row(
                  children: <Widget>[
                    Text('登录即代表同意',style: TextStyle(color: Colors.grey[600],fontSize: 10),),
                    InkWell(
                      onTap: (){},
                      child: Text('服务条款',style: TextStyle(color: Colors.blue,fontSize: 10,decoration: TextDecoration.underline)),
                    ),
                    Text('和',style: TextStyle(color: Colors.grey[600],fontSize: 10)),
                    InkWell(
                      onTap: null,
                      child: Text('隐私政策',style: TextStyle(color: Colors.blue,fontSize: 10,decoration: TextDecoration.underline)),
                    ),

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
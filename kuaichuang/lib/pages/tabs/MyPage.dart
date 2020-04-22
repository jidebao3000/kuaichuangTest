import 'package:flutter/material.dart';
import '../../icons/iconfont.dart';
import '../SettingPage.dart';
import '../../widget/UserButton.dart';
import '../../services/ScreenAdapter.dart';

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPageState();
  }

}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation:0,
        leading: IconButton(icon: Icon(Icons.settings), onPressed: (){
          Navigator.pushNamed(context, '/setting');
        }),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80,
              width: ScreenAdapter.getScreenWidth(),
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                 Container(
                   alignment: Alignment.centerLeft,
                   height: 80,
                   width: ScreenAdapter.getScreenWidth(),
                   child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       InkWell(
                         onTap:(){Navigator.pushNamed(context, '/logIn');},
                         child: Container(
                           padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                           child: Text('点击登录',style: TextStyle(fontSize: 18),),
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.only(left: 10),
                         child: Text('登录后体验更多功能',style: TextStyle(fontSize: 12,color: Colors.grey),),
                       ),
                     ],
                   ),
                 ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey[200],),
                        child: Icon(Icons.person,size: 60,),
                      ))
                ],
              ),
            ),
            SizedBox(height: 10,),
            UserBtn(color: Colors.blue,iconData: IconFont.icon_erweima,string:'我的二维码',op: (){Navigator.pushNamed(context, '/logIn');},),
            Divider(height: 1,),
            UserBtn(color: Colors.red,iconData: Icons.scanner,string:'扫一扫',op: (){Navigator.pushNamed(context, '/logIn');},),
            SizedBox(height: 10,),
            UserBtn(color: Colors.green,iconData: Icons.person,string:'访客',op: (){Navigator.pushNamed(context, '/logIn');},),
            Divider(height: 1,),
            UserBtn(color: Colors.yellow,iconData: Icons.star,string:'收藏',op: (){Navigator.pushNamed(context, '/logIn');},),
            SizedBox(height: 10,),
            UserBtn(color: Colors.blue,iconData: Icons.chat,string:'意见反馈',op: (){Navigator.pushNamed(context, '/feedback');},)
          ],
        ),
      ),
    );
  }
}
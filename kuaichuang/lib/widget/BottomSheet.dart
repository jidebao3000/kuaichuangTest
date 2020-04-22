
import 'package:flutter/material.dart';
import '../icons/iconfont.dart';
import '../services/ScreenAdapter.dart';
import 'JdButton.dart';

class BottomSheetWidget{

  static void bottom(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return GestureDetector(
              ///点击穿透问题
                behavior: HitTestBehavior.opaque,

                ///解决showModalBottomSheet点击消失的问题,外层添加GestureDetector，然后onTap返回false
                //解决showModalBottomSheet点击消失的问题
                onTap: () {
                  return false;
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(flex: 1,
                                  child: JdButton(
                                    icon: IconFont.icon_weixin_copy,
                                    color: Colors.green[800],
                                    text:  "微信",
                                    cb: () {},)),
                              Expanded(flex: 1,
                                  child: JdButton(
                                    icon: IconFont.icon_pengyouquan,
                                    color: Colors.green,
                                    text:  "朋友圈",
                                    cb: () {},)),
                              Expanded(flex: 1,
                                  child: JdButton(icon: IconFont.icon_qq,
                                    color: Colors.blue,
                                    text: 'QQ',
                                    cb: () {},)),
                               Expanded(flex: 1,
                                  child: JdButton(
                                    icon: IconFont.icon_weibo_copy1,
                                    color: Colors.red,
                                    text: '微博',
                                    cb: () {},)),

                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(margin: EdgeInsets.only(
                                  left: ScreenAdapter.getScreenWidth()/8-30),
                                child: JdButton(icon: Icons.link,
                                  color: Colors.blue,
                                  text:  "复制链接",
                                  cb: () {
                                    Navigator.of(context).pop();
                                  },),),
                              Container(margin: EdgeInsets.only(
                                  left: ScreenAdapter.getScreenWidth()/8-10),
                                child: JdButton(icon: Icons.message,
                                  color: Colors.green,
                                  text:  "短信",
                                  cb: () {},),)
                            ],
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          color: Colors.white,
                          width: ScreenAdapter.getScreenWidth(),
                          height: ScreenAdapter.height(80),
                          child: FlatButton(onPressed: () {
                            Navigator.of(context).pop();
                          },
                            child:Column(
                              children: <Widget>[
                                Divider(height: 1,color: Colors.grey,),
                                SizedBox(height: 5,),
                                Text('取消', style: TextStyle(color: Colors.black),),
                              ],
                            )),
                        ))
                  ],
                )
            );
          });
  }
}
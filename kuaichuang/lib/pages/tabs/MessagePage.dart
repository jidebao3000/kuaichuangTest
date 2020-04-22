import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessagePageState();
  }

}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation:0,
          title: TabBar(tabs: <Widget>[
            Tab(text: '私信',),
            Tab(text: '消息',),
          ]),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: null)
          ],
        ),
        body: TabBarView(children: <Widget>[
          Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 180,
                height: 35,
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(150)),
                child: Text('登录',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                    alignment: Alignment.center,
                    width: 180,
                    height: 35,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(150)),
                    child: Text('登录',style: TextStyle(color: Colors.white),),
              )
            ],
          )
        ]),
      ),

    );
  }
}
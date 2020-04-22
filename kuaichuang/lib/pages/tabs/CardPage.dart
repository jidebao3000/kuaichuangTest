import 'package:flutter/material.dart';

class CardPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardPageState();
  }

}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        elevation:0,
        centerTitle: true,
        title: Text('名片夹',style: TextStyle(fontSize: 16),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: null)
        ],
      ),
      body: Center(
        child:InkWell(
          onTap: null,
          child: Container(
            alignment: Alignment.center,
            width: 180,
            height: 35,
            decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(150)),
            child: Text('登录',style: TextStyle(color: Colors.white),),
          ),
        ) ,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:page_turn/page_turn.dart';


///翻页特效
class PageTurnWidget extends StatelessWidget{
  final List<Widget> list;

  const PageTurnWidget({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  PageTurn(
//        key: _controller,
          backgroundColor: Colors.white,
          showDragCutoff: false,
          lastPage: Container(child: Center(child: Text('Last Page!'))),
          children: list
//      ),
//    floatingActionButton: FloatingActionButton(
//    child: Icon(Icons.search),
//    onPressed: () {
//    _controller.currentState.goToPage(2);
//    },
      ),
    );
  }

}
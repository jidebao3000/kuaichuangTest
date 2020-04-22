import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import 'CardPage.dart';
import 'HomePage.dart';
import 'MessagePage.dart';
import 'MyPage.dart';


class Tabs extends StatefulWidget{
  @override
  Tabs({Key key}) : super(key: key);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    ///页面保持状态需要在用PageView，创建PageController，使用PageController.jumpToPage实现跳转
    ///也可以用IndexStack，但缺点是加载时必须4个页面都加载，购物车页不好管理状态
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  List<Widget> _pageList = [HomePage(), CardPage(), MessagePage(),MyPage()];

  @override
  Widget build(BuildContext context) {
    ///使用ScreenAdapter必须在build里调用 ScreenAdapter.init(context);
    ScreenAdapter.init(context);
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
        ///设置禁止左右滑动滚动
        onPageChanged: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(), //禁止pageView滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {

            this._currentIndex = index;
            this._pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页',style: TextStyle(fontSize: 12),)),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), title: Text('名片夹',style: TextStyle(fontSize: 12))),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息',style: TextStyle(fontSize: 12))),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('我的',style: TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../widget/SeeAlbumPainting.dart';
import '../widget/MyBottomSheet.dart';
import '../services/ScreenAdapter.dart';
import '../widget/InputSelect.dart';

///精品画册更多
class HotBtnDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HotBtnDetailsState();
  }
}

class _HotBtnDetailsState extends State<HotBtnDetails>
    with SingleTickerProviderStateMixin {

  List tabs = ['医疗', '金融', '餐饮', '教育', '旅游', '家具'];


  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);

  }

  // 迭代器生成list
  Iterable<Widget> get _inputSelects sync* {
    for (int i = 0; i < tabs.length; i++) {
      yield InputSelect(
        index: i,
        widget: Container(),
        choice: tabs[i],
        parent: this,
      );
    }
  }

  TabController tabController;
  int selectedParent = 0;

  onSelectedChanged(int _index) {
    setState(() {
      print('onSelectedChanged'+"$_index");
      selectedParent = _index;
      tabController.animateTo(selectedParent);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              title: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 14),
                  labelColor: Colors.blue,
                  labelPadding: EdgeInsets.all(10),
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  unselectedLabelColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.only(left: 5, right: 5),
                      borderSide: BorderSide(width: 5.0, color: Colors.blue)),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      text: tabs[0],
                    ),
                    Tab(
                      text: tabs[1],
                    ),
                    Tab(
                      text: tabs[2],
                    ),
                    Tab(
                      text: tabs[3],
                    ),
                    Tab(
                      text: tabs[4],
                    ),
                    Tab(
                      text: tabs[5],
                    ),
                  ]),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      selectedParent = tabController.index;
                      _showBottomSheet(200, _inputSelects.toList());
                    })
              ],
            ),
            body: TabBarView(
              controller: tabController,
                children: <Widget>[
                 ListView(
                   children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child:  Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: <Widget>[
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: (){Navigator.pushNamed(context, '/boutiqueDetails');},),
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: null,),
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: null,),
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: null,),
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: null,),
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: null,),
                          SeeAlbumPainting(productText: '群自动只能灯检机',imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                            iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',companyName: '千山制药',
                            op: null,),
                        ],
                      ),
                    )
                   ],
                 ),
                  Center(
                    child: Text('2'),
                  ),
                  Center(
                    child: Text('3'),
                  ),
                  Center(
                    child: Text('4'),
                  ),
                  Center(
                    child: Text('5'),
                  ),
                  Center(
                    child: Text('6'),
                  ),
                ])));
  }

  void _showBottomSheet(double height, List list) {
    myShowModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: new Material(
              //创建透明层
              type: MaterialType.transparency, //透明类型
              child: new Container(
                  height: height,
                  alignment: Alignment.topCenter,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            alignment: Alignment.center,
                            width: ScreenAdapter.getScreenWidth(),
                            child: Text('选择分类', style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Positioned(
                              right: 10,
                              child: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }))
                        ],
                      ),
                      Wrap(runSpacing: 0, spacing: 0, children: list)
                    ],
                  )),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import '../widget/FindCompany.dart';
import '../widget/SeeAlbumPainting.dart';
import '../widget/MyBottomSheet.dart';
import '../services/ScreenAdapter.dart';
import '../widget/InputSelect.dart';

///热门公司更多
class HotCompanyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HotCompanyDetailsState();
  }
}

class _HotCompanyDetailsState extends State<HotCompanyDetails>
    with SingleTickerProviderStateMixin {

  List tabs = ['家具', '贸易物流', '家具', '美容美妆美妆美妆', '美容美妆', '美容美妆美妆美妆' ,
    '美容美妆美妆美妆', '美容美妆' ,'餐饮', '教育', '旅游', '家具'];

  List hotCompanyList1 = [
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
  ];
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
        length: 12,
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
                      insets: EdgeInsets.only(left: 15, right: 15),
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
                      _showBottomSheet( 200,_inputSelects.toList());
                    })
              ],
            ),
            body: TabBarView(
              controller: tabController,
                children: <Widget>[
                 ListView(
                   children: <Widget>[

                     FindCompany(imageUrl:'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg' ,
                       companyName: '佛山市金福到家具制造有限公司',list: hotCompanyList1,opMore: (){Navigator.pushNamed(context, '/companyOfficialWebsite');},
                     op: (){Navigator.pushNamed(context, '/productContent');},),
                     FindCompany(imageUrl:'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg' ,
                       companyName: '佛山市金福到家具制造有限公司',list: hotCompanyList1,),
                     FindCompany(imageUrl:'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg' ,
                       companyName: '佛山市金福到家具制造有限公司',list: hotCompanyList1,),
                     FindCompany(imageUrl:'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg' ,
                       companyName: '佛山市金福到家具制造有限公司',list: hotCompanyList1,),
                     FindCompany(imageUrl:'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg' ,
                       companyName: '佛山市金福到家具制造有限公司',list: hotCompanyList1,),

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
              ///ConstrainedBox 可设置最低高度或最高高度，高度自适应的容器
              child: new ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 150),
//                  alignment: Alignment.topCenter,
//                  color: Colors.white,
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
                       Wrap(runSpacing: 0, spacing: 0, children: list),
                    ],
                  )),
            ),
          );
        });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/SeeAlbumPainting.dart';
import '../services/ScreenAdapter.dart';
import '../widget/ExpandableText.dart';

class CompanyOfficialWebsite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CompanyOfficialWebsiteState();
  }
}

class _CompanyOfficialWebsiteState extends State<CompanyOfficialWebsite>
    with SingleTickerProviderStateMixin {

  ScrollController controller =ScrollController(initialScrollOffset: 0,keepScrollOffset: true);
  double scrollOffSet=0;
  int timeNum=3;
  Timer t;
  var tabTitle = [
    '产品画册',
    '企业概况',
  ];
  @override
  void initState() {
    _showTimer();
    // TODO: implement initState
    super.initState();
    controller.addListener((){
      setState(() {
        scrollOffSet =controller.offset;
      });
    });
    _setColor();
    ///隐藏状态栏和底部操作栏
//    SystemChrome.setEnabledSystemUIOverlays([]);
    ///隐藏状态栏，显示底部操作栏
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    ///隐藏操作栏，显示顶部状态栏
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }
  void dispose(){
    super.dispose();
    controller.dispose();

  }
  ///倒计时
  _showTimer() {

    t = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {

        this.timeNum--;
      });
      if (this.timeNum == 0) {
        t.cancel(); //清除定时器
        setState(() {
          ///显示操作栏，显示顶部状态栏
          SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
        });
      }
    });
  }
  _setColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    if (useWhiteForeground(Colors.transparent)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return timeNum==0? _defaultPage():_picturePage();
  }
  Widget _picturePage(){
   return
     Material(
     child: Stack(
       alignment: Alignment.topRight,
       children: <Widget>[
         Container(
           width: ScreenAdapter.getScreenWidth(),
           height: ScreenAdapter.getScreenHeight(),
           child: Image.network('https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg',
             fit: BoxFit.cover,),
         ),
         InkWell(
           onTap: (){
             setState(() {
                t.cancel();
                timeNum=0;
                SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
             });
           },
           child: Container(
             margin: EdgeInsets.only(top: 10,right: 10),
             width: 60,
             height: 25,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(150),border: Border.all(color: Colors.white)),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text('$timeNum',style: TextStyle(color: Colors.white),),
                 Container(
                   padding: EdgeInsets.only(left: 5),
                   child: Text("跳过",style: TextStyle(color: Colors.white),),
                 )
               ],
             ),
           ),
         )
       ],
     ),
   );
  }
  Widget _defaultPage(){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            controller: controller,
            headerSliverBuilder: (context, bool) {
              return [
                SliverAppBar(
                    leading:IconButton(icon: Icon(Icons.chevron_left,color:scrollOffSet > 110 ?Colors.black:Colors.white,size: 30,),
                        onPressed: (){Navigator.pop(context);}),
                    actions: <Widget>[
                      Container(
                        width: 30,
                        child:IconButton(icon: Icon(Icons.search,color:scrollOffSet > 110 ?Colors.black:Colors.white,size: 20,),
                            onPressed: (){}) ,),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 40,
                        child:IconButton(icon: Icon(Icons.star_half,color:scrollOffSet > 110 ?Colors.black:Colors.white,size: 20,),
                            onPressed: (){}) ,)
                    ],
                    elevation: 0,
                    title: scrollOffSet > 110 ? Text("三五将军文化博物馆", style: TextStyle(fontSize: 12)) : Text(''),
                    centerTitle: true,
                    pinned: true,
                    expandedHeight: 167.0,
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode:CollapseMode.pin,
                        background: Column(children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 130,
                            child: Image.network(
                              'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: double.infinity,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 10, right: 10),
                                      width: 40,
                                      height: 40,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: ScreenAdapter.getScreenWidth()-ScreenAdapter.width(280),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "波美特家具有限公司波美特家具有限公司波美特家具有限公司",overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/logIn');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(150)),
                                    child: Text('关注', style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ]))),
                new SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    new TabBar(
                      tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                      indicatorColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blue,
                      labelPadding: EdgeInsets.all(10),
                      indicator: UnderlineTabIndicator(
                          insets: EdgeInsets.only(left: 5, right: 5),
                          borderSide: BorderSide(width: 4.0, color: Colors.blue)),
                      indicatorSize: TabBarIndicatorSize.label,
                    ),
                    color: Colors.white,

                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
                children: <Widget>[
                  productPicture(),
                  companyGeneral()
                ]
            ),
          ),
        ));
  }
  Widget productPicture() {
    return Container(
      color: Colors.grey[200],
      child: ListView(
        padding:EdgeInsets.only(top: 10),
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(

                margin: EdgeInsets.only(left: 10, right: 10),
                child: SeeAlbumPainting(
                  productText: '群自动只能灯检机',
                  imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                  iconUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
                  companyName: '千山制药',
                  op: () {
                    Navigator.pushNamed(context, '/boutiqueDetails');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: SeeAlbumPainting(
                  productText: '群自动只能灯检机',
                  imageUrl:
                  'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
                  iconUrl:
                  'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
                  companyName: '千山制药',
                  op: () {
                    Navigator.pushNamed(context, '/boutiqueDetails');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget companyGeneral() {
    String str ='但是从一月底到二月底这整整一个月，美国社会在各个层面上都没有真正重视病毒的传播。就波士顿本地来说，大家对疫情真正开始改变认识大约是3月13日左右。'
        '一个重要的现象就是NBA和各种大型体育联赛陆续停赛，民众才发觉事情真的不好了NBA停赛48个小时后，马萨诸塞州州长宣布所有非关键社会的行业都要关门暂停营业，'
        '这两天管得更严了。我现在一整天最多也就是出一次家门。我家房子旁边有一条小河，我最远就是走到河边散散步，'
        '尽量避免接触其他路人，吃饭什么的基本全都是外卖，有了天天在家工作的那种感觉。相比其他美国人，我一直追踪武汉抗疫的讯息，'
        '北京和大陆的一些朋友在二月份的时候一直也在告诉我中国国内的即时情况，回到波士顿之后我也马上组织了公益演出，'
        '所以我的脑子进入疫情的状态已经至少7周了。中国的趋势一天比一天好，美国的趋势却一天比一天差，我觉得我的脑筋最近都快废了。'
        '总体来说，我觉得民众的情绪还好，但谁知道之后事态往什么方向发展？我的家人现在都很着急，现在这种情绪都开始感染到我了。我也希望生活尽快回到正轨';
    return Container(
      color: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 4,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text('简介', style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: ScreenAdapter.getScreenWidth(),
                      child: ExpandableText(
                        text: str, maxLines: 3, style: TextStyle(fontSize: 12),
                      )
                  ),
                ],
            )
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5,top: 15),
                      child: Text('联系我们',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,top: 15),
                  child: Text('嘉兴三针宅食品有限公司'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,top: 15),
                  child: Text('行业：食品/加工',style: TextStyle(fontSize: 12,color: Colors.grey),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.access_alarm,size: 15,color: Colors.grey,),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){

                        },
                        child: Text('https://www.baidu.com',style: TextStyle(color: Colors.blue,
                            fontSize: 12,decoration: TextDecoration.underline
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone,size: 15,color: Colors.grey),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()async{
                          ///打电话
                          const url = 'tel:0573-88721333';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text('0573-88721333',style: TextStyle(color: Colors.blue,
                            fontSize: 12,decoration: TextDecoration.underline
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on,size: 15,color: Colors.grey),
                      SizedBox(width: 10,),
                      Text('中国浙江桐乡市乌镇环城东路工业园区',style: TextStyle(color: Colors.grey,
                          fontSize: 12
                      ),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;


}


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../pages/ProductContentToBig.dart';
import '../services/ScreenAdapter.dart';
///热门产品详情页
class ProductContent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentState();
  }

}

class _ProductContentState extends State<ProductContent> with SingleTickerProviderStateMixin {
  final List swiperList = ['http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
  'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
  'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg'];
  ScrollController controller =ScrollController(initialScrollOffset: 0,keepScrollOffset: true);
  double scrollOffSet=0;

  var tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setColor();
    tabController=TabController(length: 1,vsync: this);
   controller.addListener((){
     setState(() {
       scrollOffSet =controller.offset;
     });
   });
  }
  ///设置状态栏透明
  _setColor()async{
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    if (useWhiteForeground(Colors.transparent)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }
  }
  ///1.图文详情的定位可以用Positioned通过controller.offset计算呈现
  ///2.也可以使用NestedScrollView,NestedScrollView的外层必须用Material或者Scaffold包裹
  ///要实现图文详情的定位需要把图文详情控件外层包裹SliverPersistentHeader，然后放在headerSliverBuilder中
  ///SliverPersistentHeader的delegate属性需自己定义可以是tabBar也可以是其他控件
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: CustomScrollView(
                controller: controller,
                slivers: <Widget>[
                  //AppBar，包含一个导航栏
                  _buildBanner(),
                  _buildStickyBar(),
                  _buildList(),
                ],
              ),
            ),
            Positioned(
              top: scrollOffSet>170?72:244-scrollOffSet,
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text('图文详情', style: TextStyle(
                          color: Colors.grey, fontSize: 12),),
                    ),
                    Container(
                      width: 100,
                      child: Divider(
                        height: 1,
                      ),
                    ),
                  ],
                ),
              )
            ),
            Positioned(
                bottom: 0,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.getScreenWidth() / 2,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.local_florist, size: 14,),
                          Text('收藏', style: TextStyle(fontSize: 10, color: Colors.grey),)
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenAdapter.getScreenWidth() / 2,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.5,color: Colors.grey)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.home, size: 14,),
                          Text('官网', style: TextStyle(fontSize: 10, color: Colors.grey),)
                        ],
                      ),
                    )
                  ],
                ))
          ],
        )
    );
  }
  Widget _buildBanner() {
    return  SliverAppBar(
      elevation:0,
      title:Text('芒果干',style: TextStyle(color:scrollOffSet>170?Colors.black:Colors.white),) ,
      centerTitle: true,
      leading: IconButton(icon: Icon(Icons.chevron_left,size: 30,color:scrollOffSet>170?Colors.black:Colors.white,), onPressed: (){
        Navigator.pop(context);
      }),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.share,size: 20, color:scrollOffSet>170?Colors.black:Colors.white,), onPressed: null)
      ],
      pinned: true,
      expandedHeight: 220.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode:CollapseMode.pin,
        background:
        Swiper(
          itemBuilder: (BuildContext context, int index) {
            return  InkWell(
              ///放大图片
              onTap: (){Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (c, a,s) => PhotoGalleryPage(photoList: swiperList,index: 0,)));},
              child: Image.network(swiperList[index], fit: BoxFit.fill),
            );
          },

          itemCount: swiperList.length,
          pagination: new SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: FractionPaginationBuilder(
                  color: Colors.white,
                  activeFontSize: 20,
                  activeColor: Colors.grey,
                  fontSize: 20
                ///圆点分页器颜色

              )),
          autoplay: false,
          onTap: null,
        ),
      ),
    );
  }

  Widget _buildStickyBar() {
    return SliverToBoxAdapter(
      child: Container(
        width: ScreenAdapter.getScreenWidth(),
        height: 30,
        child: Text(''),
      ),
    );
//    return SliverPersistentHeader(
//      pinned: true, //是否固定在顶部
//      floating: true,
//      delegate: StickyTabBarDelegate(
//        minHeight: 30, //收起的高度
//        maxHeight: 30, //展开的最大高度
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              width: 100,
//              child: Divider(
//                height: 1,
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.only(
//                  left: 10, right: 10, top: 5, bottom: 5),
//              child: Text('图文详情', style: TextStyle(
//                  color: Colors.grey, fontSize: 12),),
//            ),
//            Container(
//              width: 100,
//              child: Divider(
//                height: 1,
//              ),
//            ),
//          ],
//        ),),
//    );
  }
  Widget _buildList() {
    List<Widget> list=[];
    for(int i = 0; i < swiperList.length; ++i) {
      list.add(InkWell(
        onTap: (){
          ///路由跳转传参
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (c, a,s) => PhotoGalleryPage(photoList: swiperList,index: i,)));
          print('index:'+"$i");
        },
        child: Image.network(swiperList[i],fit: BoxFit.fill,),
      ));
    }
    return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Column(
              children: list,
            );
          },
          childCount: 1,
        ));
  }

}
class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  StickyTabBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(StickyTabBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

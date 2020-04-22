import 'dart:math';

import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../widget/SwiperWidget.dart';
import '../../widget/HotAndMore.dart';
import '../../widget/BoutiqueButton.dart';
import '../../widget/HotCompanyBtn.dart';
import '../../widget/HotProductButton.dart';
import '../../widget/HotCardButton.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  ///轮播图数据
  List swiperList = [
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg'
  ];
  ///热门企业
  List hotCompanyList1 = [
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
  ];
  List hotCompanyList2=[
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg'
  ];
  List list1 =['看画册','找产品','找企业','着名片'];
  List list2 =['做画册','发画册','做名片','免费入住'];
  List <Widget>btnList1=[];
  List <Widget>btnList2=[];

  @override
  void initState() {
    // TODO: implement initState
    _hotButtons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        elevation:0,
        leading: Icon(Icons.map,size: 30,color: Colors.blue,),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('快创画册',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
            Container(
              width: 10,
              height: 4,
              decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(150)),
            )
          ],
        ),
      ),
      body: ListView(
          children: <Widget>[
            ///搜索框
            searchWidget(context),
            SizedBox(height: 10,),
            ///轮播图
            SwiperWidget(list:swiperList),
            SizedBox(height: 20,),
            ///热门按钮1
            Row(children: btnList1,),
            SizedBox(height: 20,),
            ///热门按钮2
            Row(children: btnList2,),
            SizedBox(height: 20,),
            Container(color:Colors.grey[200],width: ScreenAdapter.getScreenWidth(),height: 10,),
            SizedBox(height: 20,),
            ///精品画册
            HotAndMore(string: '精品画册',op: (){Navigator.pushNamed(context, '/hotBtnDetails');},),
            SizedBox(height: 10,),
            _boutiqueListView(),
            SizedBox(height: 20,),
            Container(color:Colors.grey[200],width: ScreenAdapter.getScreenWidth(),height: 10,),
            SizedBox(height: 20,),
            ///热门企业
            HotAndMore(string: '热门企业',op: (){Navigator.pushNamed(context, '/hotCompanyDetails');}),
            SizedBox(height: 10,),
            HotCompanyBtn(imageUrl:  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg' ,
              companyName: '哈尔滨三五将军文化博物馆',list: hotCompanyList1,opMore:(){Navigator.pushNamed(context, '/companyOfficialWebsite');} ,
              op: (){Navigator.pushNamed(context, '/productContent');},),
            SizedBox(height: 20,),
            HotCompanyBtn(imageUrl: 'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg' ,
              companyName: '佛山市顺德区福利来酒店家具有限公司',list: hotCompanyList2, op: (){Navigator.pushNamed(context, '/productContent');},),
            SizedBox(height: 20,),
            Container(color:Colors.grey[200],width: ScreenAdapter.getScreenWidth(),height: 10,
            ),
            SizedBox(height: 20,),
            ///热门产品
            HotAndMore(string: '热门产品',op: (){Navigator.pushNamed(context, '/hotProductDetails');}),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                HotProductButton(imageUrl:swiperList[0] ,btnName:'芒果干' ,op: (){Navigator.pushNamed(context, '/productContent');},),
                HotProductButton(imageUrl:swiperList[1] ,btnName:'豪华间' ,op: null,),
                HotProductButton(imageUrl:swiperList[2] ,btnName:'新中式乌金木' ,op: null,)
              ],
            ),
            Row(
              children: <Widget>[
                HotProductButton(imageUrl:swiperList[0] ,btnName:'套房' ,op: null,),
                HotProductButton(imageUrl:swiperList[1] ,btnName:'少将（五）' ,op: null,),
                HotProductButton(imageUrl:swiperList[2] ,btnName:'水晶吊灯-会所灯' ,op: null,)
              ],
            ),
            SizedBox(height: 20,),
            Container(color:Colors.grey[200],width: ScreenAdapter.getScreenWidth(),height: 10,),
            SizedBox(height: 20,),
            ///热门名片
            HotAndMore(string: '热门名片',op: (){Navigator.pushNamed(context, '/hotCardDetails');}),
            SizedBox(height: 10,),
            _hotCardListView(),
            SizedBox(height: 20,),
          ],
        ),
    );
  }

  _hotButtons(){
    for(var i = 0; i < list1.length; ++i) {
      btnList1.add(
        Container(
            width: (ScreenAdapter.getScreenWidth())/4,
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: (){
                      if(i==0){
                        Navigator.pushNamed(context, '/hotBtnDetails');
                      }else if(i==1){
                        Navigator.pushNamed(context, '/hotProductDetails');
                      }else if(i==2){
                        Navigator.pushNamed(context, '/hotCompanyDetails');
                      }else{
                        Navigator.pushNamed(context, '/hotCardDetails');
                      }

                    },
                    child:Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.network('http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',fit: BoxFit.cover,)),
                    )
                ),
                Text(list1[i],style: TextStyle(fontSize: 12),)
              ],
            )),
      );
    }
    for(var i = 0; i < list2.length; ++i) {
      btnList2.add(
        Container(
            width: (ScreenAdapter.getScreenWidth())/4,
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: null,
                    child:Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.network('http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',fit: BoxFit.cover,)),
                    )
                ),
                Text(list2[i],style: TextStyle(fontSize: 12),)
              ],
            )),
      );
    }
  }

  Widget _boutiqueListView() {
    return  Container(
      width: ScreenAdapter.getScreenWidth(),
      height: ScreenAdapter.height(500),
      child:  ListView(
        scrollDirection:Axis.horizontal,
        children: <Widget>[
          Container(
            padding:EdgeInsets.only(left: 5),
            child: BoutiqueButton(productText: '客房展示',companyName: '大连日航',
              iconUrl:'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
              imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',op: (){Navigator.pushNamed(context, '/boutiqueDetails');},
            ),
          ),
          BoutiqueButton(productText: '客房展示',companyName: '大连日航',
            iconUrl:'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
            imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',op: null,
          ),
          BoutiqueButton(productText: '客房展示',companyName: '大连日航',
            iconUrl:'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
            imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',op: null,
          ),
          Container(
            padding:EdgeInsets.only(right: 5),
            child: BoutiqueButton(productText: '客房展示',companyName: '大连日航',
              iconUrl:'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
              imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',op: null,
            ),
          ),
        ],
      ),
    );
  }

 Widget _hotCardListView() {
   return  Container(
     width: ScreenAdapter.getScreenWidth(),
     height: 180,
     child:  ListView(
       scrollDirection:Axis.horizontal,
       children: <Widget>[
         Container(
           padding:EdgeInsets.only(left: 5),
           child: HotCardBtn(imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
           name: '姚娇',position: '市场运营',company: '大连神奇视角网络科技有限公司',op: (){Navigator.pushNamed(context, '/cardDetails');},)
         ),
         HotCardBtn(imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
           name: '姚娇',position: '市场运营',company: '大连神奇视角网络科技有限公司',op: null,),
         HotCardBtn(imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
           name: '姚娇',position: '市场运营',company: '大连神奇视角网络科技有限公司',op: null,),
         Container(
           padding:EdgeInsets.only(right: 5),
           child: HotCardBtn(imageUrl: 'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
             name: '姚娇',position: '市场运营',company: '大连神奇视角网络科技有限公司',op: null,)
         ),
       ],
     ),
   );
 }
}
///搜索框
Widget searchWidget(context) {
  return  InkWell(
    onTap: (){Navigator.pushNamed(context,'/search');},
    child: Container(
      margin:  EdgeInsets.only(left: 10,right: 10),
      width: ScreenAdapter.getScreenWidth(),
      height: 30,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search,size: 18,color: Colors.grey[500],),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('搜企业、搜产品、名片',style: TextStyle(fontSize: 10,color: Colors.grey[500]),),)
        ],
      ),
    ),
  );

}

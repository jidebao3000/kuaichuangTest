import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../services/ScreenAdapter.dart';
import '../services/SearchServices.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}
class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin{

  ///搜索框内容
  var tfValue ='';
  List historyList=[];
  bool searchFlag =false;
  List<String> options = [
    '阿斯顿',
    '噶翻噶',
    '阿达啊啊',
    '阿斯顿阿三',
    '高度发达啊',
    '阿斯顿啊',
  ];
  List list = ['产品', '企业', '名片'];
  List swiperList = [
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
    'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
  ];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _getHistoryData();
    _tabController = TabController(length: list.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
        child:Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title:Row(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: ScreenAdapter.getScreenWidth()-ScreenAdapter.width(140),
                    decoration: BoxDecoration(color: Colors.grey[200],border: Border.all(width: 1,color: Colors.grey[200]),borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      ///给Textfield赋值，b并且保持光标在最后
                      controller:TextEditingController.fromValue(TextEditingValue(text: tfValue,selection: TextSelection.fromPosition(TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: tfValue.length)))),
                      ///键盘带搜索功能
                      textInputAction: TextInputAction.search,
                      ///点击键盘上的搜索键
                      onEditingComplete:()async{
                        if (tfValue != '') {
                          await SearchServices.setHistoryData(tfValue);
                          setState(() {
                            searchFlag =true;
                          });
//                                    _getHistoryData();
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.search,color: Colors.grey,),
                          hintText: '请输入关键字',hintStyle: TextStyle(fontSize: 12),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top:0)
                      ),
                      onChanged: (value){
                        setState(() {
                          tfValue = value;
                        });
                      },
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10),
                        child: Text('取消',style: TextStyle(fontSize: 12),
                        ) ,
                      )
                  )

                ],
              ),
              ///隐藏返回箭头
              automaticallyImplyLeading: false,
              bottom:searchFlag==false?null:TabBar(
                controller: _tabController,
                  tabs: <Widget>[
                Tab(text:list[0]),
                Tab(text: list[1]),
                Tab(text:list[2]),
              ]) ,
            ),
            body: searchFlag==false?
            SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  product(),
                  SizedBox(height: 10,),
                  _searchHistory(),
                ],
              ),
            ):_searchTabView()

        )
    ) ;

  }
  ///产品swiper
  Widget product(){
    return Container(
      color: Colors.white,
      height: ScreenAdapter.height(380),
      width: ScreenAdapter.getScreenWidth(),
      child:  Swiper(
        autoplay:false,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Text(list[index]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Icon(Icons.whatshot,color: Colors.red,size: 18,),
                  )
                ],
              ),
              Row(
//                    children: swiperList.map((value){
//                    }).toList(),
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      print(index);
                    },
                    child:  Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: (ScreenAdapter.getScreenWidth()-50)/4,
                          height: (ScreenAdapter.getScreenWidth()-50)/4,
                          child: Image.network(swiperList[0],fit: BoxFit.fill,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5,top: 5,bottom: 5),
                          alignment: Alignment.center,
                          width: (ScreenAdapter.getScreenWidth()-50)/4,
                          child: Text('头层牛哦怕皮鞋阿斯顿',style: TextStyle(fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: (ScreenAdapter.getScreenWidth()-50)/4,
                        height: (ScreenAdapter.getScreenWidth()-50)/4,
                        child: Image.network(swiperList[1],fit: BoxFit.fill),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5,top: 5,bottom: 5),
                        alignment: Alignment.center,
                        width: (ScreenAdapter.getScreenWidth()-50)/4,
                        child: Text('头层',style: TextStyle(fontSize: 12),maxLines: 1,),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: (ScreenAdapter.getScreenWidth()-50)/4,
                        height: (ScreenAdapter.getScreenWidth()-50)/4,
                        child: Image.network(swiperList[2],fit: BoxFit.fill),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5,top: 5,bottom: 5),
                        alignment: Alignment.center,
                        width: (ScreenAdapter.getScreenWidth()-50)/4,
                        child: Text('头层牛哦',style: TextStyle(fontSize: 12),maxLines: 1,),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: (ScreenAdapter.getScreenWidth()-50)/4,
                        height: (ScreenAdapter.getScreenWidth()-50)/4,
                        child: Image.network(swiperList[3],fit: BoxFit.fill),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 5,top: 5,bottom: 5),
                        width: (ScreenAdapter.getScreenWidth()-50)/4,
                        child: Text('头层牛',style: TextStyle(fontSize: 12),maxLines: 1,),
                      )
                    ],
                  ),
                ],
              )
            ],
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              ///圆点分页器颜色
                activeColor: Colors.blue,
                color: Colors.grey,
                size: 5,
                ///圆点大小
                activeSize: 5)),
//          control: new SwiperControl(),
        onTap: null,
      ),
    );
  }

  ///获取本地数据
  _getHistoryData() async {
    var _historyListData = await SearchServices.getHistoryList();
    setState(() {
      this.historyList=_historyListData;

    });
  }
  ///搜索记录
  Widget _searchHistory(){
    if(historyList.length>0){
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  width: ScreenAdapter.getScreenWidth(),
                  padding: EdgeInsets.only(left: 5,top: 10,bottom: 10),
                  child: Text('搜索历史',style: TextStyle(fontSize: 12,color: Colors.grey),),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      child: IconButton(icon: Icon(Icons.delete_forever,size: 18,), onPressed: ()async{
                        await SearchServices.clearHistoryList();
                        this._getHistoryData();
                      }),
                    ))
              ],
            ),
            Column(
              children: historyList.map((value){
                return Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            setState(() {
                              tfValue =value;
                              searchFlag =true;
                            });
                          },
                          child: Container(
                              width: ScreenAdapter.getScreenWidth(),
                              height: ScreenAdapter.height(80),
                              alignment:Alignment.centerLeft,
                              padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                              child: Text('$value', style: TextStyle(fontSize: 12),)),
                        ),
                        Positioned(
                            right: ScreenAdapter.width(30),
                            bottom:7,
                            child: InkWell(
                              onTap:()async{
                                await SearchServices.removeHistoryData(value);
                                this._getHistoryData();
                              },
                              child: Center(
                                child: Icon(Icons.clear,size: 18,color: Colors.grey,),
                              ),
                            )
                        )
                      ],
                    ),
                    Divider(height: 1,)
                  ],);
              }).toList(),
            ),
          ],
        ) ,
      );
    } else{
      return Visibility (
        visible: false,
        child: Container(),
      );
    }
  }

 Widget _searchTabView() {
   return TabBarView(
       controller: _tabController,
       children: <Widget>[
         ListView(
           children: <Widget>[
             Container(color: Colors.grey[200],
               width: ScreenAdapter.getScreenWidth(),
               height: 10,),
             Container(
               alignment: Alignment.center,
               color: Colors.white,
               width: ScreenAdapter.getScreenWidth(),
               height: 500,
               child: Text('抱歉，没有搜索到相关内容', style: TextStyle(color: Colors.grey[400]),),
             )
           ],
         ),
         ListView(
           children: <Widget>[
             Container(color: Colors.grey[200],
               width: ScreenAdapter.getScreenWidth(),
               height: 10,),
             Container(
               alignment: Alignment.center,
               color: Colors.white,
               width: ScreenAdapter.getScreenWidth(),
               height: 500,
               child: Text('抱歉，没有搜索到相关内容', style: TextStyle(color: Colors.grey[400]),),
             )
           ],
         ),
         ListView(
           children: <Widget>[
             Container(color: Colors.grey[200],
               width: ScreenAdapter.getScreenWidth(),
               height: 10,),
             Container(
               alignment: Alignment.center,
               color: Colors.white,
               width: ScreenAdapter.getScreenWidth(),
               height: 500,
               child: Text('抱歉，没有搜索到相关内容', style: TextStyle(color: Colors.grey[400]),),
             )
           ],
         )
       ]);
 }

}

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../services/ScreenAdapter.dart';
///  轮播图构件
class SwiperWidget extends StatelessWidget{
  final List list;

  const SwiperWidget({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      if(list.length>0){
        return Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          width: ScreenAdapter.getScreenWidth(),
          child: AspectRatio(
            ///图片比例
            aspectRatio: 5 / 2,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return  ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: (){Navigator.pushNamed(context, '/webViewPage',arguments: 'https://flylai.com/568.html');},
                      child: FadeInImage.assetNetwork(placeholder:'images/bg.jpg' , image: list[index],fit: BoxFit.fill,)
                    ),
                );
              },
              itemCount: list.length,
              pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    ///圆点分页器颜色
                      activeColor: Colors.blue,
                    activeSize: 8,
                    size: 8
                     )),
//          control: new SwiperControl(),
              autoplay: true,
              onTap:null,
            ),
          ),
        );
      }else{
        return Center(
          child: Text('加载中'),
        );
      }
  }
}
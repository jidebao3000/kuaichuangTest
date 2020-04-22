import 'dart:async';
import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../animation/controller_animation_listener.dart';

import 'package:kuaichuang/animation/simulation_turn.dart';
import '../animation/nove_page_painter.dart';
import '../services/ScreenAdapter.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class BoutiqueDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BoutiqueDetailsState();
  }
}

class _BoutiqueDetailsState extends State<BoutiqueDetails> with SingleTickerProviderStateMixin {

List swiperList = [

    'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/20191210071211467.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg',
  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    ];
    List<ui.Image> listImage=[];
    NovelPagePainter mPainter;
    int currentIndex=0;
    TouchEvent currentTouchEvent = TouchEvent(TouchEvent.ACTION_UP, null);
    AnimationController animationController;
    SimulationTurnPageAnimation simulationTurnPageAnimation;
    int stpaIndex;
    ui.Image newImage;
    GlobalKey canvasKey = new GlobalKey();
    ///异步获取网络图片并按尺寸缩放

    Future <ui.Image>getImage(String path,int dWidth,int dHeight) async {
      Completer<ImageInfo> completer = Completer();
      var img = new NetworkImage(path);
      ImageStream imageStream =img.resolve(ImageConfiguration());
      imageStream.addListener(ImageStreamListener((ImageInfo info,bool _){
        completer.complete(info);
      }));
      ImageInfo imageInfo = await completer.future;
      var recorder = ui.PictureRecorder();//使用PictureRecorder对图片进行录制
      Paint paint = Paint();
      Canvas canvas = Canvas(recorder);
      double srcWidth = imageInfo.image.width.toDouble();
      double srcHeight = imageInfo.image.height.toDouble();
      canvas.drawImageRect(imageInfo.image,
          // 使用drawImageRect对图片进行定尺寸填充
          Rect.fromLTWH(0, 0, srcWidth, srcHeight),
          Rect.fromLTWH(0, 0, dWidth.toDouble() ,dHeight.toDouble()), paint);
      ui.Image tempImage;
      tempImage =await recorder.endRecording().toImage(dWidth, dHeight);
      setState(() {
        newImage= tempImage;
      });
      return newImage;
    }

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,);
    simulationTurnPageAnimation =SimulationTurnPageAnimation();
    simulationTurnPageAnimation.setAnimationController(animationController);
    simulationTurnPageAnimation.setCanvasKey(canvasKey);
    _getCurrentImage(swiperList[currentIndex]);
    _getCurrentImage(swiperList[currentIndex+1]);
    _getCurrentImage(swiperList[currentIndex+2]);

    }
    _getCurrentImage(String url)async{
      var result =await getImage(url,300,300);
      setState(() {
        listImage.add(result);
        mPainter = NovelPagePainter(simulationTurnPageAnimation:simulationTurnPageAnimation,image: listImage );
      });
    }
    void dispose(){
      super.dispose();
      animationController.dispose();
    }


@override
Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
        body:
        ///手势控制
        RawGestureDetector(
          gestures: <Type, GestureRecognizerFactory>{
            VerticalDragGestureRecognizer :
            GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                  (VerticalDragGestureRecognizer instance) {
                instance
                  ..onDown = (detail) {
                    RenderBox renderBox =canvasKey.currentContext.findRenderObject();
                    Offset local = renderBox.localToGlobal(Offset(0,0));
                    stpaIndex= simulationTurnPageAnimation.returnIndex();
                    if(stpaIndex+1 ==listImage.length-1&&listImage.length!=0){
                      _getCurrentImage(swiperList[0]);
                      _getCurrentImage(swiperList[1]);
                      _getCurrentImage(swiperList[2]);
                      simulationTurnPageAnimation.setList(listImage);
                    }
                    simulationTurnPageAnimation.setOffPoint(local.dx, local.dy);
//                    RenderBox renderBox =canvasKey.currentContext.findRenderObject();
//                    Offset local = renderBox.globalToLocal(detail.globalPosition);
                      if (currentTouchEvent.action != TouchEvent.ACTION_DOWN || currentTouchEvent.touchPos != detail.globalPosition) {
                        currentTouchEvent = TouchEvent(TouchEvent.ACTION_DOWN, detail.globalPosition);
                        simulationTurnPageAnimation.onTouchEvent(currentTouchEvent);
                        canvasKey.currentContext.findRenderObject().markNeedsPaint();
                      }
                  };
                instance
                  ..onUpdate = (detail) {
                  ///全局坐标转换为局部坐标
                      if (currentTouchEvent.action != TouchEvent.ACTION_MOVE ||currentTouchEvent.touchPos != detail.globalPosition) {
                        currentTouchEvent = TouchEvent(TouchEvent.ACTION_MOVE, detail.globalPosition);

                        simulationTurnPageAnimation.onTouchEvent(currentTouchEvent);
                        canvasKey.currentContext.findRenderObject().markNeedsPaint();
                      }
                  };
                instance
                  ..onEnd = (detail) {
                      if (currentTouchEvent.action != TouchEvent.ACTION_UP || currentTouchEvent.touchPos != Offset(0, 0)) {
                        currentTouchEvent = TouchEvent<DragEndDetails>(TouchEvent.ACTION_UP, Offset(0, 0));
                        simulationTurnPageAnimation.onTouchEvent(currentTouchEvent);
                        canvasKey.currentContext.findRenderObject().markNeedsPaint();
                      }
                  };
              },
            ),
          },
            child: Container(
              margin: EdgeInsets.only(top: 100, left: 0),
              child: listImage.length == 0 ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('加载中...', style: TextStyle(fontSize: 16.0),),
                    CircularProgressIndicator(strokeWidth: 1.0,)
                  ],
                ),)
                  : CustomPaint(
                key: canvasKey,
                size: Size(300, 300),
                isComplex: true,
                painter: mPainter,
              ),
            )



//          FutureBuilder<List>(
//              future: getDataList(swiperList),
//              builder: (BuildContext context,AsyncSnapshot snapshot){
//                if(snapshot.hasData)
//                  return Container(
//                    child: CustomPaint(
//                      key: canvasKey,
//                      isComplex: true,
//                      painter: NovelPagePainter(image: snapshot.data),
//                    ),
//                  );
//                else
//                  return Center(
//                    child:CircularProgressIndicator() ,
//                  );
//              })
          ),
        );
}
}
class TouchEvent<T> {
  static const int ACTION_DOWN = 0;
  static const int ACTION_MOVE = 1;
  static const int ACTION_UP = 2;
  static const int ACTION_CANCEL = 3;

  int action;
  T touchDetail;
  Offset touchPos =
  Offset(ScreenAdapter.getScreenWidth(), ScreenAdapter.getScreenHeight());

  TouchEvent(this.action, this.touchPos);

  @override
  bool operator ==(other) {
    if (!(other is TouchEvent)) {
      return false;
    }

    return (this.action == other.action) && (this.touchPos == other.touchPos);
  }

  @override
  int get hashCode => super.hashCode;
}



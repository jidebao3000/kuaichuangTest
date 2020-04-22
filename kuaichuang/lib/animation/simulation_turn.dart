import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;


import 'package:vector_math/vector_math_64.dart' as v;
import '../services/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import '../pages/BoutiqueDetails.dart';
import 'controller_animation_listener.dart';


/// 仿真翻页动画 ///
class SimulationTurnPageAnimation  {
  bool isStartAnimation = false;
  Offset minDragDistance = Offset(10, 10);
  Path mTopPagePath = Path();
  Path mBottomPagePath = Path();
  Path mTopBackAreaPagePath = Path();
  Path mShadowPath = Path();
  int currentIndex=1;
  TouchEvent currentTouchData;
  GlobalKey _globalKey;
  AnimationController animationController;
  List <ui.Image>list=[];
  double mCornerX = 1; // 拖拽点对应的页脚
  double mCornerY = 1;
  STATE currentState;
  bool mIsRTandLB; // 是否属于右上左下
  Offset mTouch=Offset(0,0);
  Offset mBezierStart1 = new Offset(0, 0); // 贝塞尔曲线起始点
  Offset mBezierControl1 = new Offset(0, 0); // 贝塞尔曲线控制点
  Offset mBezierVertex1 = new Offset(0, 0); // 贝塞尔曲线顶点
  Offset mBezierEnd1 = new Offset(0, 0); // 贝塞尔曲线结束点

  Offset mBezierStart2 = new Offset(0, 0); // 另一条贝塞尔曲线
  Offset mBezierControl2 = new Offset(0, 0);
  Offset mBezierVertex2 = new Offset(0, 0);
  Offset mBezierEnd2 = new Offset(0, 0);

  double mMiddleX;
  double mMiddleY;
  double mDegrees;
  double mTouchToCornerDis;
  double addX;
  double addY;
  double mMaxLength;
  Size currentSize;

  bool isTurnToNext = false;
  bool isConfirmAnimation=false;

  Tween<Offset> currentAnimationTween;
  Animation<Offset> currentAnimation;

  AnimationStatusListener statusListener ;
  List swiperList = [
    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/795/w950h645/20191210/8e14-iknhexi3453243.jpg',
    'https://himg2.huanqiucdn.cn/attachment2010/2019/1210/201912071211467.jpg',
    'http://n.sinaimg.cn/sports/2_img/upload/4c53f12c/434/w1700h1134/20191209/9140-iknhexi1861460.jpg'
  ];

  void setSize(Size size){
    currentSize =size;

  }
  void calBezierPoint() {
    mMiddleX = (mTouch.dx + mCornerX) / 2;
    mMiddleY = (mTouch.dy + mCornerY) / 2;

    mMaxLength = math
        .sqrt(math.pow(currentSize.width, 2) + math.pow(currentSize.height, 2));

    mBezierControl1 = Offset(
        mMiddleX - (mCornerY - mMiddleY) * (mCornerY - mMiddleY) / (mCornerX - mMiddleX), mCornerY.toDouble());

    double f4 = mCornerY - mMiddleY;
    if (f4 == 0) {

      mBezierControl2 = Offset(mCornerX.toDouble(), mMiddleY - (mCornerX - mMiddleX) * (mCornerX - mMiddleX) / 0.1);
    } else {

      mBezierControl2 = Offset(mCornerX.toDouble(), mMiddleY - (mCornerX - mMiddleX) * (mCornerX - mMiddleX) / (mCornerY - mMiddleY));
    }

//    print("mBezierControl1.dx=${mBezierControl1.dx}");
//    print("mBezierControl1.dy=${mBezierControl1.dy}");
//    print("mBezierControl2.dx=${mBezierControl2.dx}");
//    print("mBezierControl2.dx=${mBezierControl2.dy}");


    mBezierStart1 = Offset(mBezierControl1.dx - (mCornerX - mBezierControl1.dx) / 2, mCornerY.toDouble());

    // 当mBezierStart1.x < 0或者mBezierStart1.x > 480时
    // 如果继续翻页，会出现BUG故在此限制
    if (mTouch.dx > 0 && mTouch.dx < currentSize.width) {
      if (mBezierStart1.dx < 0 || mBezierStart1.dx > currentSize.width) {
        if (mBezierStart1.dx < 0) {
          mBezierStart1 =
              Offset(currentSize.width - mBezierStart1.dx, mBezierStart1.dy);
        }

        double f1 = (mCornerX - mTouch.dx).abs();
        double f2 = currentSize.width * f1 / mBezierStart1.dx;
        mTouch = Offset((mCornerX - f2).abs(), mTouch.dy);

        double f3 =
            (mCornerX - mTouch.dx).abs() * (mCornerY - mTouch.dy).abs() / f1;
        mTouch = Offset((mCornerX - f2).abs(), (mCornerY - f3).abs());

        mMiddleX = (mTouch.dx + mCornerX) / 2;
        mMiddleY = (mTouch.dy + mCornerY) / 2;

        mBezierControl1 = Offset(
            mMiddleX -
                (mCornerY - mMiddleY) *
                    (mCornerY - mMiddleY) /
                    (mCornerX - mMiddleX),
            mCornerY);

        double f5 = mCornerY - mMiddleY;
        if (f5 == 0) {
          mBezierControl2 = Offset(mCornerX,
              mMiddleY - (mCornerX - mMiddleX) * (mCornerX - mMiddleX) / 0.1);
        } else {
          mBezierControl2 = Offset(
              mCornerX,
              mMiddleY -
                  (mCornerX - mMiddleX) *
                      (mCornerX - mMiddleX) /
                      (mCornerY - mMiddleY));
        }

        mBezierStart1 = Offset(
            mBezierControl1.dx - (mCornerX - mBezierControl1.dx) / 2,
            mBezierStart1.dy);
      }
    }

    mBezierStart2 = Offset(mCornerX.toDouble(),
        mBezierControl2.dy - (mCornerY - mBezierControl2.dy) / 2);

    mTouchToCornerDis = math.sqrt(math.pow((mTouch.dx - mCornerX), 2) +
        math.pow((mTouch.dy - mCornerY), 2));

    mBezierEnd1 = getCross(mTouch, mBezierControl1, mBezierStart1, mBezierStart2);

    mBezierEnd2 = getCross(mTouch, mBezierControl2, mBezierStart1, mBezierStart2);

    mBezierVertex1 = Offset(
        (mBezierStart1.dx + 2 * mBezierControl1.dx + mBezierEnd1.dx) / 4,
        (2 * mBezierControl1.dy + mBezierStart1.dy + mBezierEnd1.dy) / 4);

    mBezierVertex2 = Offset(
        (mBezierStart2.dx + 2 * mBezierControl2.dx + mBezierEnd2.dx) / 4,
        (2 * mBezierControl2.dy + mBezierStart2.dy + mBezierEnd2.dy) / 4);
  }

  /// 获取交点 ///
  Offset getCross(Offset p1, Offset p2, Offset p3, Offset p4) {
    // 二元函数通式： y=kx+b(k是斜率)
    double k1 = (p2.dy - p1.dy) / (p2.dx - p1.dx);
    double b1 = ((p1.dx * p2.dy) - (p2.dx * p1.dy)) / (p1.dx - p2.dx);

    double k2 = (p4.dy - p3.dy) / (p4.dx - p3.dx);
    double b2 = ((p3.dx * p4.dy) - (p4.dx * p3.dy)) / (p3.dx - p4.dx);

    return Offset((b2 - b1) / (k1 - k2), k1 * ((b2 - b1) / (k1 - k2)) + b1);
  }

  /// 计算拖拽点对应的拖拽脚 ///
  void calcCornerXY(double x, double y) {
//    if (x <= currentSize.width / 2+addX) {
//      mCornerX = addX;
//    } else {
//      mCornerX = currentSize.width+addX;
//    }
//    if (y <= currentSize.height / 2+addY) {
//      mCornerY = addY;
//    } else {
//      mCornerY = currentSize.height+addY;
//    }
    if (x <= currentSize.width / 2+addX) {
      mCornerX = addX;
    } else {
      mCornerX = currentSize.width+addX;
    }
    if (y <= currentSize.height / 3+addY) {
      mCornerY = addY;
    } else if(y >= currentSize.height*2 / 3+addY){
      mCornerY = currentSize.height+addY;
    }else{
      mCornerY= currentSize.height/2+addY;
    }
    print('mTouch.dx=${mCornerY}-------mCornerX=${mCornerX}------$isTurnToNext');
//    if ((mCornerX == addX && mCornerY == currentSize.height+addY) ||
//        (mCornerX == currentSize.width+addX && mCornerY == addY)) {
//      mIsRTandLB = true;
//    } else {
//      mIsRTandLB = false;
//    }
  }

  void onTouchEvent(TouchEvent event) {

    /// 如果正在执行动画，判断是否需要中止动画
    if (currentState == STATE.STATE_ANIMATING) {
      if (event.action == TouchEvent.ACTION_DOWN) {
        interruptCancelAnimation();
      }
    }
//    print(event);
    /// 用户抬起手指后，是否需要执行动画
    if (event.action == TouchEvent.ACTION_UP || event.action == TouchEvent.ACTION_CANCEL) {
      if (isConfirmArea()) {
        ///下一页或者上一页
        startConfirmAnimation();
      } else if(isCancelArea()){
        ///取消翻页
        startCancelAnimation();
      }
    } else {
      if (event.touchPos != null) {
        mTouch = event.touchPos;
      }
      switch (event.action) {
        case TouchEvent.ACTION_DOWN:
          calcCornerXY(mTouch.dx, mTouch.dy);
          break;
        case TouchEvent.ACTION_MOVE:
          isTurnToNext = mTouch.dx - mCornerX < 0;
          if ((!isTurnToNext && isCanGoPre()) || (isTurnToNext && isCanGoNext())) {
            isStartAnimation = true;
          }
          break;
        case TouchEvent.ACTION_UP:
        case TouchEvent.ACTION_CANCEL:

        default:
          break;
      }

      calBezierPoint();
    }

  }
  void setList(List<ui.Image> mList){
    this.list =mList;

  }
void setOffPoint(double x,double y){
    addX =x;
    addY =y;
}
  void onDraw(Canvas canvas) {
    if (isStartAnimation && (mTouch.dx != 0 && mTouch.dy != 0)) {
      drawTopPageCanvas(canvas);
      drawBottomPageCanvas(canvas);
      drawTopPageBackArea(canvas);
    } else {
      canvas.drawImage(list[currentIndex], Offset(0,0), Paint());
      print('画层');
    }

    isStartAnimation = false;
  }


  /// 画在最顶上的那页 ///
  void drawTopPageCanvas(Canvas canvas) {
    mTopPagePath.reset();
//   if(mCornerY==addY+currentSize.height/2){
//     mTopPagePath.moveTo(addX,  addY);
//     mTopPagePath.lineTo(mTouch.dx, addY);
//     mTopPagePath.lineTo(mTouch.dx, addY+currentSize.height);
//     mTopPagePath.lineTo(addX, addY+currentSize.height);

     mTopPagePath.moveTo(mCornerX == 0 ? currentSize.width : 0, mCornerY);
     mTopPagePath.lineTo(mBezierStart1.dx, mBezierStart1.dy);
     mTopPagePath.quadraticBezierTo(mBezierControl1.dx, mBezierControl1.dy, mBezierEnd1.dx, mBezierEnd1.dy);
     mTopPagePath.lineTo(mTouch.dx, mTouch.dy);
     mTopPagePath.lineTo(mBezierEnd2.dx, mBezierEnd2.dy);
     mTopPagePath.quadraticBezierTo(mBezierControl2.dx, mBezierControl2.dy, mBezierStart2.dx, mBezierStart2.dy);
     mTopPagePath.lineTo(mCornerX, mCornerY == 0 ? currentSize.height : 0);
     mTopPagePath.lineTo(mCornerX == 0 ? currentSize.width : 0, mCornerY == 0 ? currentSize.height : 0);

    mTopPagePath.close();

    /// 去掉PATH圈在屏幕外的区域，减少GPU使用
//    mTopPagePath = Path.combine(
//        PathOperation.intersect,
//        Path()
//          ..moveTo(addX, addY)
//          ..lineTo(currentSize.width+addX, addY)
//          ..lineTo(currentSize.width+addX, currentSize.height+addY)
//          ..lineTo(addX, currentSize.height+addY)
//          ..close(),
//        mTopPagePath);

    canvas.drawImage(list[currentIndex], Offset(0,0), Paint()..isAntiAlias = true);
    print('画顶层');
//    drawTopPageShadow(canvas);
    canvas.restore();
  }

//  /// 画顶部页的阴影 ///
//  void drawTopPageShadow(Canvas canvas) {
//    Path shadowPath = Path();
//
//    int dx = mCornerX == 0 ? 5 : -5;
//    int dy = mCornerY == 0 ? 5 : -5;
//
//    shadowPath = Path.combine(
//        PathOperation.intersect,
//        Path()
//          ..moveTo(0, 0)
//          ..lineTo(currentSize.width, 0)
//          ..lineTo(currentSize.width, currentSize.height)
//          ..lineTo(0, currentSize.height)
//          ..close(),
//        Path()
//          ..moveTo(mTouch.dx + dx, mTouch.dy + dy)
//          ..lineTo(mBezierControl2.dx + dx, mBezierControl2.dy + dy)
//          ..lineTo(mBezierControl1.dx + dx, mBezierControl1.dy + dy)
//          ..close());
//
//    canvas.drawShadow(shadowPath, Colors.black, 5, true);
//  }

  /// 画翻起来的底下那页 ///
  void drawBottomPageCanvas(Canvas canvas) {
//    if(mCornerY==addY+currentSize.height/2){
//      mBottomPagePath.moveTo(addX+currentSize.width,addY);
//      mBottomPagePath.lineTo(mTouch.dx, addY);
//      mBottomPagePath.lineTo(mTouch.dx, addY+currentSize.height);
//      mBottomPagePath.lineTo(addX+currentSize.width, addY+currentSize.height);
//      mBottomPagePath.lineTo(addX+currentSize.width,addY);
//      mBottomPagePath.close();

      mBottomPagePath.reset();
      mBottomPagePath.moveTo(mCornerX, mCornerY);
      mBottomPagePath.lineTo(mBezierStart1.dx, mBezierStart1.dy);
      mBottomPagePath.quadraticBezierTo(mBezierControl1.dx, mBezierControl1.dy, mBezierEnd1.dx, mBezierEnd1.dy);
      mBottomPagePath.lineTo(mBezierEnd2.dx, mBezierEnd2.dy);
      mBottomPagePath.quadraticBezierTo(mBezierControl2.dx, mBezierControl2.dy, mBezierStart2.dx, mBezierStart2.dy);
      mBottomPagePath.close();
      Path extraRegion = Path();
      extraRegion.reset();
      extraRegion.moveTo(mTouch.dx, mTouch.dy);
      extraRegion.lineTo(mBezierVertex1.dx, mBezierVertex1.dy);
      extraRegion.lineTo(mBezierVertex2.dx, mBezierVertex2.dy);
      extraRegion.close();
      mBottomPagePath =
          Path.combine(PathOperation.difference, mBottomPagePath, extraRegion);
//    /// 去掉PATH圈在屏幕外的区域，减少GPU使用
//    mBottomPagePath = Path.combine(
//        PathOperation.intersect,
//        Path()
//          ..moveTo(0, 0)
//          ..lineTo(currentSize.width, 0)
//          ..lineTo(currentSize.width, currentSize.height)
//          ..lineTo(0, currentSize.height)
//          ..close(),
//        mBottomPagePath);
    canvas.save();
    canvas.clipPath(mBottomPagePath, doAntiAlias: false);
    canvas.drawImage(isTurnToNext?list[currentIndex+1]:list[currentIndex-1], Offset(addX,addY), Paint()..isAntiAlias = true);
    print('画底层');
//    drawBottomPageShadow(canvas);
    canvas.restore();
  }

//  /// 画底下那页的阴影 ///
//  void drawBottomPageShadow(Canvas canvas) {
//    double left;
//    double right;
//
//    Gradient shadowGradient;
//    if (mIsRTandLB) {
//      //左下及右上
//      left = 0;
//      right = mTouchToCornerDis / 4;
//
//      shadowGradient = new LinearGradient(
//        colors: [
//          Color(0xAA000000),
//          Colors.transparent,
//        ],
//      );
//    } else {
//      left = -mTouchToCornerDis / 4;
//      right = 0;
//
//      shadowGradient = new LinearGradient(
//        colors: [
//          Colors.transparent,
//          Color(0xAA000000),
//        ],
//      );
//    }
//
//    canvas.translate(mBezierStart1.dx, mBezierStart1.dy);
//    canvas.rotate(math.atan2(
//        mBezierControl1.dx - mCornerX, mBezierControl2.dy - mCornerY));
//
//    var shadowPaint = Paint()
//      ..isAntiAlias = false
//      ..style = PaintingStyle.fill //填充
//      ..shader = shadowGradient
//          .createShader(Rect.fromLTRB(left, 0, right, mMaxLength));
//
//    canvas.drawRect(Rect.fromLTRB(left, 0, right, mMaxLength), shadowPaint);
//  }

  /// 画在最顶上的那页的翻转过来的部分 ///
  /// 仿真翻页中性能损失最大的部分，注释掉drawTopPageBackArea能保证绘制会在16ms以内，但是去掉注释，部分情况甚至会到40+
  /// 盲猜是过于复杂的图层处理导致的(Flutter的图层处理性能还是不如原生啊……但是好像图层绘制性能很强大，好像甚至优于原生)
  void drawTopPageBackArea(Canvas canvas) {
    mBottomPagePath.reset();
    mBottomPagePath.moveTo(mCornerX, mCornerY);
    mBottomPagePath.lineTo(mBezierStart1.dx, mBezierStart1.dy);
    mBottomPagePath.quadraticBezierTo(mBezierControl1.dx, mBezierControl1.dy, mBezierEnd1.dx, mBezierEnd1.dy);
    mBottomPagePath.lineTo(mTouch.dx, mTouch.dy);
    mBottomPagePath.lineTo(mBezierEnd2.dx, mBezierEnd2.dy);
    mBottomPagePath.quadraticBezierTo(mBezierControl2.dx, mBezierControl2.dy, mBezierStart2.dx, mBezierStart2.dy);
    mBottomPagePath.close();

    Path tempBackAreaPath = Path();

    tempBackAreaPath.reset();
    tempBackAreaPath.moveTo(mBezierVertex1.dx, mBezierVertex1.dy);
    tempBackAreaPath.lineTo(mBezierVertex2.dx, mBezierVertex2.dy);
    tempBackAreaPath.lineTo(mTouch.dx, mTouch.dy);
    tempBackAreaPath.close();

    if (tempBackAreaPath == null || mBottomPagePath == null) {
      return;
    }

    /// 取path 相交部分 ///
    mTopBackAreaPagePath = Path.combine(
        PathOperation.intersect, tempBackAreaPath, mBottomPagePath);

    /// 去掉PATH圈在屏幕外的区域，减少GPU使用
    mTopBackAreaPagePath = Path.combine(
        PathOperation.intersect,
        Path()
          ..moveTo(addX, addY)
          ..lineTo(currentSize.width+addX, addY)
          ..lineTo(currentSize.width+addX, currentSize.height+addY)
          ..lineTo(addX, currentSize.height+addY)
          ..close(),
        mTopBackAreaPagePath);

    canvas.save();
    canvas.clipPath(mTopBackAreaPagePath);
    canvas.save();
    mTopBackAreaPagePath.getBounds();
    canvas.translate(mBezierControl1.dx, mBezierControl1.dy);

    /// 矩阵公式：α表示翻转页面和边的夹角
    /// https://juejin.im/post/5a32ade0f265da43252954b2
    ///
    ///  -(1-2sin(a)^2 )   2sin(a)cos(a)   0
    ///  2sin(a)cos(a)      1-2sin(a)^2    0
    ///  0                0             1
//
    double dis = math.sqrt(math.pow((mCornerX - mBezierControl1.dx), 2) +
        math.pow((mBezierControl2.dy - mCornerY), 2));
    double sinAngle = (mCornerX - mBezierControl1.dx) / dis;
    double cosAngle = (mBezierControl2.dy - mCornerY) / dis;

    Matrix4 matrix4 = Matrix4.columns(
        v.Vector4(
            -(1 - 2 * sinAngle * sinAngle), 2 * sinAngle * cosAngle, 0, 0),
        v.Vector4(2 * sinAngle * cosAngle, (1 - 2 * sinAngle * sinAngle), 0, 0),
        v.Vector4(0, 0, 1, 0),
        v.Vector4(0, 0, 0, 1));

    matrix4.translate(-mBezierControl1.dx, -mBezierControl1.dy);
    canvas.transform(matrix4.storage);

    /// 用image处理有奇效……原因未知，好像是picture是保存了绘制信息的原因，所以像这种n次平移->翻转->半透明图层叠加->裁剪->加阴影 的复杂操作处理不过来
    /// image相对简单，就是张图片，处理了就处理了，不会留下需要保存的信息
    /// 反正是一个半透明处理的，所以对清晰度没要求，所以这里用image绘制
    /// 我个人的猜测……求精通底层的大佬解惑

    canvas.drawImage(list[currentIndex], Offset(addX,addY), Paint()..isAntiAlias = true);
    print('画背面');

    canvas.restore();
  }

  Animation<Offset> getCancelAnimation(
      AnimationController controller, GlobalKey canvasKey) {
    if ((!isTurnToNext && !isCanGoPre()) || (isTurnToNext && !isCanGoNext())) {
      return null;
    }
    isConfirmAnimation=false;

    if (currentAnimation == null) {
      currentAnimationTween = Tween(begin: Offset.zero, end: Offset.zero);

      currentAnimation = currentAnimationTween.animate(controller);
    }

    currentAnimationTween.begin = mTouch;
    currentAnimationTween.end = Offset(mCornerX, mCornerY);

    return currentAnimation;

  }

  Animation<Offset> getConfirmAnimation(
      AnimationController controller, GlobalKey canvasKey) {
    if ((!isTurnToNext && !isCanGoPre()) || (isTurnToNext && !isCanGoNext())) {
      return null;
    }
    isConfirmAnimation=true;
    if (currentAnimation == null) {
      currentAnimationTween = Tween(begin: Offset.zero, end: Offset.zero);
      currentAnimation = currentAnimationTween.animate(controller);
    }

    if(statusListener==null){
      statusListener=(status) {
        switch (status) {
          case AnimationStatus.dismissed:
            break;
          case AnimationStatus.completed:

            if(isConfirmAnimation){
              if (isTurnToNext&&currentIndex<list.length-1) {
                if(animationController.isCompleted){
                  isStartAnimation = false;
                  currentIndex++;
                }
              } else {
                isStartAnimation = false;
                currentIndex--;
              }
              canvasKey.currentContext.findRenderObject().markNeedsPaint();
            }
            break;
          case AnimationStatus.forward:
          case AnimationStatus.reverse:
            break;
        }
      };

      currentAnimation.addStatusListener(statusListener);
    }

    if(statusListener!=null&&!(controller as AnimationControllerWithListenerNumber).statusListeners.contains(statusListener)){
      currentAnimation.addStatusListener(statusListener);
    }

       currentAnimationTween.begin = mTouch;
       currentAnimationTween.end = Offset(
           mCornerX == addX ? addX+currentSize.width*2 : addX - currentSize.width,
           addY+currentSize.height/2);
    return currentAnimation;
  }

  Simulation getFlingAnimationSimulation(
      AnimationController controller, DragEndDetails details) {
    return null;
  }
  void startConfirmAnimation() {
    Animation<Offset> animation = getConfirmAnimation(
        animationController, _globalKey);

    if (animation == null) {
      return;
    }
    setAnimation(animation);

    animationController.forward();

  }
  ///返回当前页数
  int returnIndex(){
    return currentIndex;
  }
  void startCancelAnimation() {
    Animation<Offset> animation =
    getCancelAnimation(animationController, _globalKey);

    if (animation == null) {
      return;
    }

    setAnimation(animation);

    animationController.forward();
  }

  void setAnimation(Animation<Offset> animation) {
    if (!animationController.isCompleted) {
      animation
        ..addListener(() {
          currentState = STATE.STATE_ANIMATING;
          _globalKey.currentContext?.findRenderObject()?.markNeedsPaint();
          onTouchEvent( TouchEvent(TouchEvent.ACTION_MOVE, animation.value));
        })
        ..addStatusListener((status) {
          switch (status) {
            case AnimationStatus.dismissed:
              break;
            case AnimationStatus.completed:
              break;
            case AnimationStatus.forward:
            case AnimationStatus.reverse:
              currentState = STATE.STATE_ANIMATING;
              break;
          }
        });
    }

    if (animationController.isCompleted) {

      animationController.reset();

    }
  }
  void setAnimationController(AnimationController animationController) {
    animationController.duration = const Duration(milliseconds: 600);
    this.animationController = animationController;

  }
  void setCanvasKey(GlobalKey globalKey){
    _globalKey =globalKey;
  }
  void interruptCancelAnimation() {
    if (animationController != null && !animationController.isCompleted) {
      animationController.stop();
      currentState = STATE.STATE_IDE;
      onTouchEvent(TouchEvent(TouchEvent.ACTION_UP, Offset(0, 0)));
      currentTouchData = TouchEvent(TouchEvent.ACTION_UP, Offset(0, 0));
    }
  }


  bool isCancelArea() {
    return isTurnToNext?(mTouch.dx).abs() > (currentSize.width / 4*3+addX):(mTouch.dx).abs() < (currentSize.width / 4+addX);
  }
  bool isConfirmArea() {
    return isTurnToNext?(mTouch.dx).abs() < (currentSize.width / 4*3+addX):(mTouch.dx).abs() > (currentSize.width / 4+addX);
  }
  bool isCanGoPre(){
    return currentIndex>0;
  }
  bool isCanGoNext(){
    return currentIndex<list.length-1;
  }
}
enum STATE { STATE_ANIMATING, STATE_IDE }

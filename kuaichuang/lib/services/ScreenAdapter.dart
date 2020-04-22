
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScreenAdapter{

  static init(context){
//    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil.init(context,width: 750,height: 1334,allowFontScaling: false);
  }
  static height(double value){
     return ScreenUtil().setHeight(value);
  }
  static width(double value){
      return ScreenUtil().setWidth(value);
  }
  static getScreenHeight(){
    return ScreenUtil.screenHeightDp;
  }
  static getScreenWidth(){
    return ScreenUtil.screenWidthDp;
  }

  static getScreenPxHeight(){
    return ScreenUtil.screenHeight;
  }
  static getScreenPxWidth(){
    return ScreenUtil.screenWidth;
  }
  ///根据手机系统设置字体自动缩放
  static size(double value){
   return ScreenUtil().setSp(value);
  }

  // ScreenUtil.screenHeight 
}

// ScreenAdaper
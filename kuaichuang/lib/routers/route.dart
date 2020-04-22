import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kuaichuang/pages/CompanyOfficialWebsite.dart';
import 'package:kuaichuang/pages/WebViewPage.dart';
import '../pages/ProductContent.dart';
import '../pages/LoginPage.dart';
import '../pages/SearchResult.dart';
import '../pages/SearchPage.dart';
import '../pages/HotBtnDetails.dart';
import '../pages/SettingPage.dart';
import '../pages/FeedBackPage.dart';
import '../pages/HotCardMore.dart';
import '../pages/HotCompanyDetails.dart';
import '../pages/HotProductDetails.dart';
import '../pages/BoutiqueDetails.dart';
import '../pages/CardDetails.dart';
import '../pages/ProductContentToBig.dart';


///配置路由
final routes ={
////  '/':(context)=>Tabs(),
  '/productContent': (context) => ProductContent(),
  '/logIn': (context) => LoginPage(),
  '/boutiqueDetails': (context) => BoutiqueDetails(),
  '/feedback': (context) => FeedBackPage(),
  '/search': (context) => SearchPage(),
  '/searchResult': (context) => SearchResult(),
  '/hotBtnDetails': (context) => HotBtnDetails(),
  '/hotCompanyDetails': (context) => HotCompanyDetails(),
  '/hotCardDetails': (context) => HotCardMore(),
  '/hotProductDetails': (context) => HotProductDetails(),
  '/setting': (context) => SettingPage(),
  '/cardDetails': (context) => CardDetails(),
  '/companyOfficialWebsite': (context) => CompanyOfficialWebsite(),
//  //传值
  '/webViewPage': (context,{arguments}) => WebViewPage(url: arguments),
//  '/registerPhone': (context,{arguments}) => RegisterSecondPhonePage(arguments: arguments,),
//  '/registerEmail': (context,{arguments}) => RegisterSecondEmailPage(arguments: arguments,),



};


//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
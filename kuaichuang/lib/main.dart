
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'routers/route.dart';
import 'pages/tabs/Tabs.dart';

main() async {
  runApp(MyApp());
  ///设置状态栏颜色
  await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  if (useWhiteForeground(Colors.white)) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
          ///去除右上角debug图标
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
//      initialRoute: '/',
            theme: ThemeData(
                primaryColor: Colors.white),
            home:  new Tabs()
        );

  }


}


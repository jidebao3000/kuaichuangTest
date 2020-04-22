import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

///设置页面
class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingPageState();
  }

}

class _SettingPageState extends State<SettingPage> {
  var _cacheSizeStr = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///获取缓存大小
    loadCache();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        width: ScreenAdapter.getScreenWidth(),
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            InkWell(
                child: Container(color: Colors.white,
                  height: 40,
                  child: createButton('账号绑定'),)
            ),
            SizedBox(height: 20,),
            InkWell(
                child: Container(color: Colors.white,
                  height: 40,
                  child: createButton('消息通知'),)
            ),
            Divider(height: 1,),
            InkWell(
                child: Container(color: Colors.white,
                  height: 40,
                  child: createButton('隐私'),)
            ),
            Divider(height: 1,),
            InkWell(
              onTap: ()async{_clearCache();},
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    width: ScreenAdapter.getScreenWidth(),
                    child: Text('清除缓存'),
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                width:100,
                                child:  Text(_cacheSizeStr, style: TextStyle(color: Colors.grey),)
                            ),
                            Container(
                              child:IconButton(
                                  icon: Icon(Icons.chevron_right), onPressed: null),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
                child: Container(color: Colors.white,
                  height: 40,
                  child: createButton('关于我们'),)
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){},
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(border:Border.all(width: 1,color: Colors.grey[400]),color: Colors.white),
                child: Text('登录',style: TextStyle(color: Colors.blue),),
              ),
            )


          ],
        ),
      ),
    );
  }

  ///
  Widget createButton(String string) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          width: ScreenAdapter.getScreenWidth(),
          child: Text(string),
        ),
        Positioned(
            right: 0,
            child: Container(
              child:IconButton(
                  icon: Icon(Icons.chevron_right), onPressed: null),
            ))
      ],
    );
  }


  ///加载缓存
  Future<Null> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    print(tempDir);
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    print(value);
//       tempDir.list(followLinks: false,recursive: true).listen((file){
//          //打印每个缓存文件的路径
//        print(file.path);
//      });
    print('临时目录大小: ' + value.toString());
    setState(() {
      _cacheSizeStr = _renderSize(value); // _cacheSizeStr用来存储大小的值
      print('临时目录大小: ' + _cacheSizeStr);
    });
  }

  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  ///格式化文件大小
  _renderSize(double value) {
    if (null == value) {
      return '0.00M';
    }
    value = value / 1024/1024;
    String size = value.toStringAsFixed(2)+"M";
    return size ;
  }

  ///清除缓存
  void _clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    await loadCache();
    Fluttertoast.showToast(
        msg: '清除缓存成功',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
    );
  }

  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }
}

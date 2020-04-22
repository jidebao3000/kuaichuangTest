import 'dart:io';
import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import 'package:image_picker/image_picker.dart';


class FeedBackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedBackState();
  }
}

class _FeedBackState extends State<FeedBackPage> {
  File _image;
  List _list = [];
  ///拍照
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      if(_image!=null){
        _list.add(_image);
        _image =null;
      }
    });
  }
  ///相册
  Future getImageFromPhotoAlbum() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      if(_image!=null){
        _list.add(_image);
        _image =null;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
      child: Scaffold(
        appBar: AppBar(
          title: Text('意见反馈'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: ScreenAdapter.getScreenHeight(),
            width: ScreenAdapter.getScreenWidth(),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  height: 45,
                  width: ScreenAdapter.getScreenWidth(),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(hintText: '请填写您的联系方式',
                        hintStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 10,top: 10),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                  height: ScreenAdapter.height(500),
                  width: ScreenAdapter.getScreenWidth(),
                  child: TextField(
                    maxLines: 14,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10),
                        hintText: '感谢您使用快创画册，使用过程中有任何意见或者建议请反馈给我们',
                        hintStyle: TextStyle(fontSize: 12),
                        border: InputBorder.none),
                  ),
                ),
                _photoWrap(),
                InkWell(
                  onTap: null,
                  child: Container(
                    margin: EdgeInsets.only(top: 30,left: 20),
                    width: ScreenAdapter.getScreenWidth()-40,
                    height: 40,
                    child: Center(
                      child: Text('提交',style: TextStyle(color: Colors.white),),
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  ///上传照片控件
  Widget _photoWrap(){
    if(_list.length>0){
      List <Widget>tempList=[];
      for(int i =0;i<_list.length;i++){
        tempList.add(wrapItem(_list[i],i));
      }
      tempList.add(SizedBox(width: 20,));
      tempList.add(InkWell(
        onTap: _bottomSheet,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
          child: Icon(Icons.add),
        ),
      ));
      return Wrap(
          children:
          tempList
      );
    }else{
      return InkWell(
        onTap: _bottomSheet,
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
          child: Icon(Icons.add),
        ),
      );
    }
  }
  Widget wrapItem(var im,int i){
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20,top: 20),
          width: 50,
          height: 50,
          child: Image.file(im, fit: BoxFit.fill,),

        ),
        InkWell(
          onTap: (){
            setState(() {
              deleteWrapItem(i);
            });
          },
          child: Opacity(opacity: 0.4,
              child: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.only(left: 60,top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),),
                child: Icon(Icons.cancel,),)
          ),
        )
      ],
    );
  }
  ///删除照片
  deleteWrapItem(int i){
    List tempList=[];
    for (var j = 0; j < _list.length; ++j) {
      if(j!=i){
        tempList.add(_list[j]);
      }
    }
    _list=tempList;
  }
  ///底部弹出框
  _bottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        context: context,
        builder: (context){
          return GestureDetector(
            ///点击穿透问题
              behavior:HitTestBehavior.opaque ,
              ///解决showModalBottomSheet点击消失的问题,外层添加GestureDetector，然后onTap返回false
              //解决showModalBottomSheet点击消失的问题
              onTap: () {
                return false;
              },
              child:Container(
                width: ScreenAdapter.getScreenWidth(),
                height: 140,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap:(){
                        getImageFromCamera();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: ScreenAdapter.getScreenWidth(),
                        height: 45,
                        child: Center(
                          child: Text('拍照',style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                    ),
                    Divider(height: 1,),
                    InkWell(
                      onTap:(){
                        getImageFromPhotoAlbum();
                        Navigator.of(context).pop();
                      } ,
                      child: Container(
                        width: ScreenAdapter.getScreenWidth(),
                        height: 45,
                        child: Center(
                          child: Text('从相册选择',style: TextStyle(color: Colors.blue),),
                        ),
                      ),
                    ),
                    Divider(height: 1,),
                    InkWell(
                      onTap:(){ Navigator.of(context).pop();} ,
                      child: Container(
                        width: ScreenAdapter.getScreenWidth(),
                        height: 45,
                        child: Center(
                          child: Text('取消'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );});

  }

}


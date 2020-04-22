
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter/services.dart';

class PhotoGalleryPage extends StatefulWidget {
  final List photoList;
  final int index;
  PhotoGalleryPage({this.photoList, this.index});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PhotoGalleryPageState();
  }
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {

  int currentIndex = 0;
  int initialIndex; //初始index
  int length;
  int title;

  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    length = widget.photoList.length;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {

    return Material(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery
                .of(context)
                .size
                .height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(
                        widget.photoList[index]),
                    initialScale: PhotoViewComputedScale.contained * 1,
                  );
                },
                itemCount: widget.photoList.length,
                // loadingChild: widget.loadingChild,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: initialIndex),
                //点进去哪页默认就显示哪一页
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child:Text('${currentIndex+1} / ${length}',style: TextStyle(color: Colors.white),)
              ),
              Positioned(
                left: 10,
                top: 50,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Opacity(opacity: 0.4,
                      child: Container(
                        width: 10,
                        height: 10,
//                        margin: EdgeInsets.only(left: 60,top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),),
                        child: Icon(Icons.cancel,color: Colors.white,),)
                  ),
                ),
              )
            ],
          )),
    );
  }
}


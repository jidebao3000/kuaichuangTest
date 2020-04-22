import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget{
  final String url;

  const WebViewPage({Key key, this.url}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState();
  }
}

class _WebViewState extends State {
  bool _flag=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("新闻详情")
        ),
        body:Column(
          children: <Widget>[
            this._flag?_getMoreWidget():Text(""),
            Expanded(
              child: InAppWebView(
                initialUrl: "https://flylai.com/568.html",
                onProgressChanged: (InAppWebViewController controller, int progress) {
//                  print("----------------${progress/100}");
                  if((progress/100)>0.5){
                    setState(() {
                      this._flag=false;
                    });
                  }
                },
                initialOptions: InAppWebViewWidgetOptions(
                    inAppWebViewOptions: InAppWebViewOptions(
                      debuggingEnabled: true,
                    )
                ),
              ),

            )
          ],
        )
    );
  }
  //加载中的圈圈
  Widget _getMoreWidget() {

    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
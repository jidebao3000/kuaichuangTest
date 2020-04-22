import 'package:flutter/material.dart';

class AlicePage extends StatefulWidget {
  final String url;
  const AlicePage({Key key, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AlicePageState();
  }

}

class _AlicePageState extends State<AlicePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: FadeInImage.assetNetwork(placeholder: 'images/bg.jpg', image: widget.url),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:kuaichuang/animation/simulation_turn.dart';


class NovelPagePainter extends CustomPainter {
  SimulationTurnPageAnimation simulationTurnPageAnimation;
  List<ui.Image> image;
  NovelPagePainter({this.simulationTurnPageAnimation, this.image});


  @override
  Future<void> paint(Canvas canvas, Size size) async {

//    ///-----------------animation-------------------///

    if(image!=[]){

      simulationTurnPageAnimation.setSize(size);
      simulationTurnPageAnimation.setList(image);
      simulationTurnPageAnimation.onDraw(canvas);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
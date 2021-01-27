import 'dart:math';

import 'package:fl05_materialapp/base_painter.dart';
import 'package:fl05_materialapp/circula_slider_paint.dart';
import 'package:fl05_materialapp/slider_painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialExample());
}

class MaterialExample extends StatefulWidget {
  @override
  _MaterialExampleState createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> {
  double angle = 0;
  int startAngle = 0;
  int endAngle = 120 ;
  double lengthLine = 5 ;
  //Vertical drag details
  DragStartDetails startVerticalDragDetails;
  DragUpdateDetails updateVerticalDragDetails;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primaryColor: Colors.yellowAccent
      // ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Example Clock'),
          ),
          body: GestureDetector(
            onVerticalDragStart: (dragDetails) {
              startVerticalDragDetails = dragDetails;
            },
            onVerticalDragUpdate: (dragDetails) {
              updateVerticalDragDetails = dragDetails;
              double dx = updateVerticalDragDetails.globalPosition.dx -
                  startVerticalDragDetails.globalPosition.dx;
              double dy = updateVerticalDragDetails.globalPosition.dy -
                  startVerticalDragDetails.globalPosition.dy;
              //double velocity = endDetails.primaryVelocity; lay gia tri van toc
              print("S ${(dx - dy).abs()}"); // quang duong di duoc
              double s = (dx - dy).abs();
              int sCal = s ~/ 20; //tang 10 don vi
              setState(() {
                if(dx - dy > 0){
                  angle += sCal;
                  if(angle.toInt() > endAngle) angle = endAngle.toDouble();
                }else{
                  angle -= sCal;
                  if(angle.toInt() < startAngle) angle = startAngle.toDouble();
                }
                // dx - dy > 0 ? angle += sCal : angle -= sCal;
                // print(angle);
              });
            },
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: CircularSliderPaint(
                        init: angle.toInt(),
                        startAngle: startAngle,
                        endAngle: endAngle,
                        lengthLine: lengthLine,
                      ),
                    ),
                    SizedBox(
                      height: 280,
                      width: 280,
                      child: CustomPaint(
                        painter: DashedArc(color: Colors.blue),
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}

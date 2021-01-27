import 'dart:math';

import 'package:fl05_materialapp/ultil.dart';
import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  int startAngle;
  int endAngle;
  double lengthLine;
  Offset center;
  double radius;

  SliderPainter(
      {@required this.startAngle, @required this.endAngle, @required this.lengthLine});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = Colors.green[300]
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0;
    Paint progress = _getPaint(color: Colors.yellow);

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2);
    double w = size.width, h = size.height;
    canvas.drawCircle(center, radius, paint);

    List<TextPainter> lsTextPainter = List<TextPainter>(5);
    canvas.drawLine(Offset(w/2, h/2 + radius - lengthLine), Offset(w / 2, h/2 + radius + lengthLine), paint);
    double startTextNumber = 0;
    lsTextPainter[0] = getTextPaint(startTextNumber.toInt().toString(), canvas, Offset(w / 2, h/2 + radius + lengthLine));
    // TextSpan span = new TextSpan(style: new TextStyle(color: Colors.blue[800]), text: "0");
    // TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    // tp.layout();
    canvas.drawLine(Offset(( 0 - w/2 ) * sqrt(2)/2 + w/2 - lengthLine, ( 0 - w/2 ) * -sqrt(2)/2 + h/2), Offset(( 0 - w/2 ) * sqrt(2)/2 + w/2 + lengthLine, ( 0 - w/2 ) * -sqrt(2)/2 + h/2), paint);
    startTextNumber = endAngle/4 + startTextNumber;
    lsTextPainter[1] = getTextPaint(startTextNumber.toInt().toString(), canvas, Offset(( 0 - w/2 ) * sqrt(2)/2 + w/2 + lengthLine, ( 0 - w/2 ) * -sqrt(2)/2 + h/2));
     
    
    
    canvas.drawLine(Offset(0 - lengthLine, h/2), Offset(0 + lengthLine, h/2), paint);
    startTextNumber = endAngle/4 + startTextNumber;
    lsTextPainter[2] = getTextPaint(startTextNumber.toInt().toString(), canvas, Offset(0 + lengthLine, h/2));
    canvas.drawLine(Offset(( 0 - w/2 ) * sqrt(2)/2 + w/2 - lengthLine, ( 0 - w/2 ) * sqrt(2)/2 + h/2), Offset(( 0 - w/2 ) * sqrt(2)/2 + w/2 + lengthLine, ( 0 - w/2 ) * sqrt(2)/2 + h/2), paint);
    startTextNumber = endAngle/4 + startTextNumber;
    lsTextPainter[3] = getTextPaint(startTextNumber.toInt().toString(), canvas, Offset(( 0 - w/2 ) * sqrt(2)/2 + w/2 + lengthLine, ( 0 - w/2 ) * sqrt(2)/2 + h/2));
   
   
    canvas.drawLine(Offset(w / 2, h/2 - radius - lengthLine), Offset(w / 2, h/2 - radius + lengthLine), paint);
    startTextNumber = endAngle/4 + startTextNumber;
    lsTextPainter[4] = getTextPaint(startTextNumber.toInt().toString(), canvas, Offset(w / 2, h/2 - radius + lengthLine));
    // for(int i = startAngle; i <= endAngle; i++){
    //   canvas.drawLine(Offset(50, 100), Offset(150, 220), paint);
    // }
    
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
    //     -pi / 2 + startAngle, sweepAngle, false, progress);

    // Paint handler = _getPaint(color: Colors.yellow, style: PaintingStyle.fill);
    // Paint handlerOutter = _getPaint(color: Colors.yellow, width: 2.0);

    // // draw handlers
    // initHandler = radiansToCoordinates(center, -pi / 2 + startAngle, radius);
    // canvas.drawCircle(initHandler, 8.0, handler);
    // canvas.drawCircle(initHandler, 12.0, handlerOutter);

    // endHandler = radiansToCoordinates(center, -pi / 2 + endAngle, radius);
    // canvas.drawCircle(endHandler, 8.0, handler);
    // canvas.drawCircle(endHandler, 12.0, handlerOutter);
  }
  TextPainter getTextPaint(String text, Canvas canvas, Offset offset){
    TextSpan span = new TextSpan(style: new TextStyle(color: Colors.blue[800]), text: text);
    TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, offset);
    return tp;
  }
  Paint _getPaint({@required Color color, double width, PaintingStyle style}) =>
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? 12.0;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
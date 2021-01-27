import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class DashedArc extends CustomPainter {
  final Color color;

  DashedArc({Color color}) : color = color ?? Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: remove me. This makes it easier to tell
    // where the canvas should be
    // canvas.drawRect(
    //     Offset.zero & size,
    //     Paint()
    //       ..color = Colors.black
    //       ..style = PaintingStyle.stroke);

    var width = 520, height = 520, scale;

    // this is a simple Boxfit calculation for the `cover` mode. You could
    // use the applyBoxFit function instead, but as it doesn't return a 
    // centered rect it's almost as much work to use it as to just do it
    // manually (unless someone has a better way in which case I'm all ears!)
    double rw = size.width / width;
    double rh = size.height / height;

    double actualWidth, actualHeight, offsetLeft, offsetTop;
    if (rw > rh) {
      // height is constraining attribute so scale to it
      actualWidth = rh * width;
      actualHeight = size.height;
      offsetTop = 0.0;
      offsetLeft = (size.width - actualWidth) / 2.0;
      scale = rh;
    } else {
      // width is constraining attribute so scale to it
      actualHeight = rw * height;
      actualWidth = size.width;
      offsetLeft = 0.0;
      offsetTop = (size.height - actualHeight) / 2.0;
      scale = rw;
    }

    canvas.translate(offsetLeft, offsetTop);
    canvas.scale(scale);

    // parameters from the original drawing (guesstimated a bit using
    // preview...)
     double startX = size.width;
     double startY = size.height + 260; // flutter starts counting from top left
     double dashSize = 5;
     double gapSize = 16;
    canvas.drawPath(
        dashPath(
            Path()
              // tell the path where to start
              ..moveTo(startX, startY)
              // the offset tells the arc where to end, the radius is the
              // radius of the circle, and largeArc tells it to use the 
              // big part of the circle rather than the small one. 
              // The implied parameter `clockwise` means that it starts the arc
              // and draw clockwise; setting this to false would result in a large
              // arc below!
              ..arcToPoint(Offset(1 + startX, startY), radius: Radius.circular(260), largeArc: true),
            // dash is `dashSize` long followed by a gap `gapSize` long
            dashArray: CircularIntervalList<double>([dashSize, gapSize]),
            dashOffset: DashOffset.percentage(0.005)),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = dashSize);
  }

  @override
  bool shouldRepaint(DashedArc oldDelegate) {
    return oldDelegate.color != this.color;
  }
}
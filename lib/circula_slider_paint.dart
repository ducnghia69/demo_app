import 'package:fl05_materialapp/base_painter.dart';
import 'package:fl05_materialapp/slider_painter.dart';
import 'package:fl05_materialapp/ultil.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CircularSliderPaint extends StatefulWidget {
  final int init;
  final Widget child;
  final int startAngle;
  final int endAngle;
  final double lengthLine;
  CircularSliderPaint({
    @required this.init,
    @required this.startAngle,
    @required this.endAngle,
    @required this.lengthLine,
    this.child,
  });

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSliderPaint> {
  SliderPainter _painter;
  double angle = 0;
  @override
  void initState() {
    super.initState();
  }

  // we need to update this widget both with gesture detector but
  // also when the parent widget rebuilds itself
  @override
  void didUpdateWidget(CircularSliderPaint oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (oldWidget.init != widget.init || oldWidget.end != widget.end) {
    //   _calculatePaintData();
    // }
  }

  void _update(u) {
    setState(() {
      double testAngle = atan2(u.localPosition.dy, u.localPosition.dx);

      if (testAngle >= 0 && testAngle <= pi / 2) {
        setState(() {
          angle = testAngle;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: 300,
      alignment: Alignment.centerRight,
      child: CustomPaint(
        painter: SliderPainter(
            startAngle: widget.startAngle,
            endAngle: widget.endAngle,
            lengthLine: widget.lengthLine),
        foregroundPainter: _painter,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(widget.init.toString()),
          ),
        ),
      ),
    );
    // return SafeArea(
    //   child: Column(
    //     children: <Widget>[
    //       Container(
    //           child: Stack(
    //             children: <Widget>[
    //               SizedBox(
    //                 width: 300,
    //                 height: 300,
    //                 child: Container(
    //                   child: GestureDetector(
    //                     child: CustomPaint(
    //                       painter: SliderPainter(
    //                           startAngle: 0, endAngle: 60, lengthLine: 5),
    //                       foregroundPainter: _painter,
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(12.0),
    //                         child: Center(
    //                           child: Text(widget.vl.toString()),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 // Change to your preferred size.
    //                 // Width and height will be used under "paint" method below.
    //                 // The canvas accesses it by using size.width, size.height
    //                 height: 300,
    //                 width: 300,
    //                 child: CustomPaint(
    //                   painter: DashedArc(color: Colors.blue),
    //                 ),
    //               )
    //             ],
    //           )),
    //       // Slider.adaptive(
    //       //     value: widget.vl,
    //       //     min: 0,
    //       //     max: 60,
    //       //     divisions: 60,
    //       //     onChanged: (newValuue) {
    //       //       setState(() {
    //       //         widget.vl = newValuue;
    //       //         print(widget.vl);
    //       //       });
    //       //     }),
    //     ],
    //   ),
    // );
  }

  // void _calculatePaintData() {
  //   double initPercent = valueToPercentage(widget.init, widget.intervals);
  //   double endPercent = valueToPercentage(widget.end, widget.intervals);
  //   double sweep = getSweepAngle(initPercent, endPercent);

  //   _startAngle = percentageToRadians(initPercent);
  //   _endAngle = percentageToRadians(endPercent);
  //   _sweepAngle = percentageToRadians(sweep.abs());

  //   _painter = SliderPainter(
  //     startAngle: _startAngle,
  //     endAngle: _endAngle,
  //     sweepAngle: _sweepAngle,
  //   );
  // }

  // // _onPanUpdate(DragUpdateDetails details) {
  // //   if (!_isInitHandlerSelected && !_isEndHandlerSelected) {
  // //     return;
  // //   }
  // //   if (_painter.center == null) {
  // //     return;
  // //   }
  // //   RenderBox renderBox = context.findRenderObject();
  // //   var position = renderBox.globalToLocal(details.globalPosition);

  // //   var angle = coordinatesToRadians(_painter.center, position);
  // //   var percentage = radiansToPercentage(angle);
  // //   var newValue = percentageToValue(percentage, widget.intervals);

  // //   if (_isInitHandlerSelected) {
  // //     widget.onSelectionChange(newValue, widget.end);
  // //   } else {
  // //     widget.onSelectionChange(widget.init, newValue);
  // //   }
  // // }

  // // _onPanEnd(_) {
  // //   _isInitHandlerSelected = false;
  // //   _isEndHandlerSelected = false;
  // // }

  // // _onPanDown(DragDownDetails details) {
  // //   if (_painter == null) {
  // //     return;
  // //   }
  // //   RenderBox renderBox = context.findRenderObject();
  // //   var position = renderBox.globalToLocal(details.globalPosition);
  // //   if (position != null) {
  // //     _isInitHandlerSelected = isPointInsideCircle(
  // //         position, _painter.initHandler, 12.0);
  // //     if (!_isInitHandlerSelected) {
  // //       _isEndHandlerSelected = isPointInsideCircle(
  // //           position, _painter.endHandler, 12.0);
  // //     }
  // //   }
  // // }

}

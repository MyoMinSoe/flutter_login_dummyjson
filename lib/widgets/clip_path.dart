import 'package:flutter/material.dart';

class ClipPathShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 223, 52, 94)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1041111, size.height * -0.0014667);
    path_0.quadraticBezierTo(size.width * 0.1452593, size.height * 0.6758833,
        size.width * 0.3166944, size.height * 0.7911500);
    path_0.cubicTo(
        size.width * 0.4812870,
        size.height * 0.9202667,
        size.width * 0.5916019,
        size.height * 0.7847833,
        size.width * 0.7646944,
        size.height * 0.8027000);
    path_0.quadraticBezierTo(size.width * 0.9260000, size.height * 0.8248833,
        size.width * 0.9995093, size.height * 1.0179000);
    path_0.lineTo(size.width * 1.0017963, size.height * -0.0070167);

    canvas.drawPath(path_0, paint_fill_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///////////////////////////////////////////////////////////////////////////////
///

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*1.0852337514253136).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class LogInClipPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8572292, size.height * 0.9947465);
    path_0.lineTo(size.width * 0.1427708, size.height * 0.9947465);
    path_0.arcToPoint(Offset(size.width * 0.005701254, size.height * 0.8684423),
        radius:
            Radius.elliptical(size.width * 0.1370696, size.height * 0.1263042),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.005701254, size.height * 0.2986709);
    path_0.arcToPoint(Offset(size.width * 0.1090536, size.height * 0.1762543),
        radius:
            Radius.elliptical(size.width * 0.1370696, size.height * 0.1263042),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.8235234, size.height * 0.009193591);
    path_0.cubicTo(
        size.width * 0.9101482,
        size.height * -0.01105332,
        size.width * 0.9942987,
        size.height * 0.04926714,
        size.width * 0.9942987,
        size.height * 0.1316207);
    path_0.lineTo(size.width * 0.9942987, size.height * 0.8684423);
    path_0.arcToPoint(Offset(size.width * 0.8572292, size.height * 0.9947465),
        radius:
            Radius.elliptical(size.width * 0.1370696, size.height * 0.1263042),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01140251;
    paint_0_stroke.color = Colors.black12;
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//


import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../flutter_painter.dart';
import '../sized1ddrawable.dart';

class WavyLineWithArrowDrawable extends Sized1DDrawable
    implements ShapeDrawable {
  @override
  Paint paint;

  final double waveAmplitude;
  final int waveFrequency;
  final double arrowSize;

  WavyLineWithArrowDrawable({
    Paint? paint,
    required double length,
    required Offset position,
    double rotationAngle = 0,
    double scale = 1,
    Set<ObjectDrawableAssist> assists = const <ObjectDrawableAssist>{},
    Map<ObjectDrawableAssist, Paint> assistPaints =
        const <ObjectDrawableAssist, Paint>{},
    bool locked = false,
    bool hidden = false,
    this.waveAmplitude = 5.0,
    this.waveFrequency = 5,
    this.arrowSize = 10.0,
  })  : paint = paint ?? ShapeDrawable.defaultPaint,
        super(
          length: length,
          position: position,
          rotationAngle: rotationAngle,
          scale: scale,
          assists: assists,
          assistPaints: assistPaints,
          locked: locked,
          hidden: hidden,
        );

  @protected
  @override
  EdgeInsets get padding => EdgeInsets.all(paint.strokeWidth / 2);

  @override
  void drawObject(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(position.dx - length / 2 * scale, position.dy);

    for (double x = position.dx - length / 2 * scale;
        x <= position.dx + length / 2 * scale;
        x += 1.0) {
      final y = position.dy +
          waveAmplitude *
              scale *
              sin((x - position.dx) * waveFrequency * 2 * pi / length);
      path.lineTo(x, y);
    }

    final arrowPath = Path();

    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..strokeWidth = paint.strokeWidth,
    );

    canvas.drawPath(arrowPath, paint..style = PaintingStyle.fill);
  }

  @override
  WavyLineWithArrowDrawable copyWith({
    bool? hidden,
    Set<ObjectDrawableAssist>? assists,
    Offset? position,
    double? rotation,
    double? scale,
    double? length,
    Paint? paint,
    bool? locked,
    double? waveAmplitude,
    int? waveFrequency,
    double? arrowSize,
  }) {
    return WavyLineWithArrowDrawable(
      hidden: hidden ?? this.hidden,
      assists: assists ?? this.assists,
      position: position ?? this.position,
      rotationAngle: rotation ?? rotationAngle,
      scale: scale ?? this.scale,
      length: length ?? this.length,
      paint: paint ?? this.paint,
      locked: locked ?? this.locked,
      waveAmplitude: waveAmplitude ?? this.waveAmplitude,
      waveFrequency: waveFrequency ?? this.waveFrequency,
      arrowSize: arrowSize ?? this.arrowSize,
    );
  }
}

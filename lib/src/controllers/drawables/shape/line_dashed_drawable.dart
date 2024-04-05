import 'package:flutter/material.dart';
import '../../../../flutter_painter.dart';
import '../sized1ddrawable.dart';

class DashedLineDrawable extends Sized1DDrawable implements ShapeDrawable {
  /// The paint to be used for the dashed line drawable.
  @override
  Paint paint;

  /// The length of each dash segment.
  final double dashLength;

  /// The length of each space between dashes.
  final double spaceLength;

  /// Creates a new [DashedLineDrawable] with the given [length], [paint], and dash properties.
  DashedLineDrawable({
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
    this.dashLength = 5.0,
    this.spaceLength = 5.0,
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

  /// Getter for padding of drawable.
  ///
  /// Add padding equal to the stroke width of the dashed line.
  @protected
  @override
  EdgeInsets get padding => EdgeInsets.all(paint.strokeWidth / 2);

  /// Draws the dashed line on the provided [canvas] of size [size].
  /// Draws the dashed line on the provided [canvas] of size [size].
  @override
  void drawObject(Canvas canvas, Size size) {
    final double totalLength = length / (dashLength + spaceLength);
    final double space = spaceLength * scale;
    final double dash = dashLength * scale;

    final Path path = Path();
    double startX = position.dx - length / 2 * scale;

    for (int i = 0; i < totalLength; i++) {
      path.moveTo(startX, position.dy);
      path.lineTo(startX + dash, position.dy);
      startX += dash + space;
    }

    final double arrowLength = 15.0 * scale; // Length of the arrow
    final double arrowWidth = 10.0 * scale; // Width of the arrow
    final Path arrowPath = Path()
      ..moveTo(startX, position.dy)
      ..lineTo(startX - arrowLength, position.dy - arrowWidth / 2)
      ..lineTo(startX - arrowLength, position.dy + arrowWidth / 2)
      ..close();

    path.addPath(arrowPath, Offset(0, 0)); // Attach arrow to the dashed line

    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..strokeWidth = paint.strokeWidth,
    );
  }

  /// Creates a copy of this but with the given fields replaced with the new values.
  @override
  DashedLineDrawable copyWith({
    bool? hidden,
    Set<ObjectDrawableAssist>? assists,
    Offset? position,
    double? rotation,
    double? scale,
    double? length,
    Paint? paint,
    bool? locked,
    double? dashLength,
    double? spaceLength,
  }) {
    return DashedLineDrawable(
      hidden: hidden ?? this.hidden,
      assists: assists ?? this.assists,
      position: position ?? this.position,
      rotationAngle: rotation ?? rotationAngle,
      scale: scale ?? this.scale,
      length: length ?? this.length,
      paint: paint ?? this.paint,
      locked: locked ?? this.locked,
      dashLength: dashLength ?? this.dashLength,
      spaceLength: spaceLength ?? this.spaceLength,
    );
  }
}

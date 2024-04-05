import 'package:flutter/material.dart';
import '../../../flutter_painter.dart';
import '../drawables/shape/line_dashed_drawable.dart';
import 'shape_factory.dart';

/// A [DashedLineDrawable] factory.
class DashedLineFactory extends ShapeFactory<DashedLineDrawable> {
  /// Creates an instance of [DashedLineFactory].
  DashedLineFactory() : super();

  /// Creates and returns a [DashedLineDrawable] with length of 0 and the passed [position], [paint], [dashLength], and [spaceLength].
  @override
  DashedLineDrawable create(Offset position,
      [Paint? paint, double dashLength = 5.0, double spaceLength = 5.0]) {
    return DashedLineDrawable(
      length: 0,
      position: position,
      paint: paint,
      dashLength: dashLength,
      spaceLength: spaceLength,
    );
  }
}

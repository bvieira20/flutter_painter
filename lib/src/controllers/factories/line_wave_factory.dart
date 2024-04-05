import 'package:flutter/material.dart';

import '../../../flutter_painter.dart';
import '../drawables/shape/line_wave_drawable.dart';

class WavyLineWithArrowFactory extends ShapeFactory<WavyLineWithArrowDrawable> {
  WavyLineWithArrowFactory() : super();

  @override
  WavyLineWithArrowDrawable create(Offset position,
      [Paint? paint,
      double waveAmplitude = 5.0,
      int waveFrequency = 5,
      double arrowSize = 10.0]) {
    return WavyLineWithArrowDrawable(
      length: 0,
      position: position,
      paint: paint,
      waveAmplitude: waveAmplitude,
      waveFrequency: waveFrequency,
      arrowSize: arrowSize,
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SinusCurve extends Curve {
  @override
  double transformInternal(double t) {
    return 0.5 + math.sin(t * 2 * math.pi) * 0.5;
  }

  @override
  double transform(double t) {
    if (t == 0.0 || t == 1.0) {
      return t;
    }
    return super.transform(t);
  }
  // @override
  // double transform(double t) {
  // if (t == 0.0 || t == 1.0) {
  //   assert(curve.transform(t).round() == t);
  //   return t;
  // }
  // return curve.transform(t);
  // }
}

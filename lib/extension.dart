import 'package:flutter/material.dart';

extension CustomOne on dynamic {
  Center center() {
    return Center(
      child: this,
    );
  }

  SafeArea safe() {
    return SafeArea(
      child: this,
    );
  }

  Transform transform(double scale) {
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }

  Text text(String string, [TextStyle textStyle]) {
    return Text(
      string,
      style: textStyle,
    );
  }

  TextStyle textStyle([FontWeight fontWeight, Color color]) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
    );
  }
}

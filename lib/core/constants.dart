import 'dart:ui';

import 'package:flutter/cupertino.dart';

Widget kWidth(double width) {
  return SizedBox(
    width: width,
  );
}

Widget kHeight(double height) {
  return SizedBox(
    height: height,
  );
}

TextStyle kGetTextStyle(Color color, double size, FontWeight? fontWeight) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: size);
}

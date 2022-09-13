import 'package:flutter/cupertino.dart';

class SizeConfig {
  final BuildContext _context;
  late double _height;
  late double _width;
  late double _scaleFactor;
  late double _aspectRatio;
  SizeConfig(this._context) {
    MediaQueryData queryData = MediaQuery.of(_context);
    _height = queryData.size.height / 100.0;
    _width = queryData.size.width / 100.0;
    _aspectRatio = queryData.size.aspectRatio;
    _scaleFactor = 10 * (_aspectRatio / _width);

    print(_scaleFactor);
  }
  double rH(double v) {
    return _height * v;
  }

  double rW(double v) {
    return _width * v;
  }

  double rT(double v) {
    return v * _scaleFactor;
  }
}

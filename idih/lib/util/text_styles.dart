import 'package:flutter/material.dart';

TextStyle title({bool responsible = false, double? height, Color? color}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'NanumSquareNeo',
    color: color,
    height: height,
  );
}

TextStyle button({bool responsible = false, double? height, Color? color}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'AppleSDGothicNeo',
    color: color,
    height: height,
  );
}

TextStyle body1({bool responsible = false, double? height, Color? color}) {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'AppleSDGothicNeo',
    color: color,
    height: height,
  );
}

TextStyle body2({bool responsible = false, double? height, Color? color}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'AppleSDGothicNeo',
    color: color,
    height: height,
  );
}

TextStyle caption({bool responsible = false, double? height, Color? color}) {
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'AppleSDGothicNeo',
    color: color,
    height: height,
  );
}

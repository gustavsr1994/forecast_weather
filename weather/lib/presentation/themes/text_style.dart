import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle textSmallColor({Color? color, @required bool? boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 12,
  );
}

TextStyle textMediumColor({Color? color, @required bool? boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 15,
  );
}

TextStyle textLargeColor({Color? color, @required bool? boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 18,
  );
}

TextStyle textVeryLargeColor({Color? color, @required bool? boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 22,
  );
}

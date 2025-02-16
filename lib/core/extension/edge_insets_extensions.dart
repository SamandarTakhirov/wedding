import 'package:flutter/cupertino.dart';

extension CopyWithExtension on EdgeInsets {
  EdgeInsets withTop(double val) => copyWith(top: val);

  EdgeInsets withBottom(double val) => copyWith(bottom: val);
}

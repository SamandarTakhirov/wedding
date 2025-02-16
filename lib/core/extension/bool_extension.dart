part of 'extension.dart';

extension BoolExtensions on bool? {
  bool get isNotTrue => this == false;

  bool get isTrue => this ?? false;
}

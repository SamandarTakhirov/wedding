part of 'extension.dart';

extension DefineNull on Object? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

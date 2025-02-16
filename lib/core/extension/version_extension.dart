part of 'extension.dart';

extension VersionParsing on String {
  int get toVersion => int.tryParse(this) ?? 0;
}

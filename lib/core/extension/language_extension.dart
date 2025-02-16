import 'dart:ui';

extension DefineLanguage on Locale? {
  bool get isUz => this?.scriptCode == 'Latn';

  bool get isRu => this?.scriptCode == null;

  bool get isCr => this?.scriptCode == 'Cyrl';
}

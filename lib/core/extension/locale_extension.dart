part of 'extension.dart';

extension LocaleExtension on Locale {
  String get getShortLang => switch (scriptCode) {
        'Latn' => 'uz',
        'Cyrl' => 'cr',
        _ => 'ru',
      };

  T map<T>({
    required T Function() onUz,
    required T Function() onRu,
    required T Function() onCyr,
  }) =>
      switch (scriptCode) {
        'Latn' => onUz(),
        'Cyrl' => onCyr(),
        _ => onRu(),
      };
}

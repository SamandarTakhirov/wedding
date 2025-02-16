// ignore_for_file: parameter_assignments, deprecated_member_use

part of 'extension.dart';

extension ColorExtensions on Color {
  Color darken(int? percent) {
    if ((percent ?? 0) < 1) return this;
    percent as int;
    if (percent > 100) percent = 100;
    return withRed(red * (100 - percent) ~/ 100)
        .withBlue(blue * (100 - percent) ~/ 100)
        .withGreen(green * (100 - percent) ~/ 100);
  }
}

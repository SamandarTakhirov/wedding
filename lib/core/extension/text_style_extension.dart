part of 'extension.dart';

extension CopyWith on TextStyle {
  /// copy with color
  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle get withColorWhite => copyWith(color: Colors.white);

  TextStyle get withColorBlack => copyWith(color: Colors.black);

  TextStyle get withColorPrimary => copyWith(color: colorLightScheme.primary);

  TextStyle get withColorSecondary => copyWith(color: colorLightScheme.secondary);

  TextStyle get withColorError => copyWith(color: colorLightScheme.error);

  /// copy with size
  TextStyle withSize(double size) => copyWith(fontSize: size);

  /// copy with Weight
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  TextStyle get withWeightNormal => copyWith(fontWeight: FontWeight.normal);

  TextStyle get withWeightBold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get withWeightW100 => copyWith(fontWeight: FontWeight.w100);

  TextStyle get withWeightW200 => copyWith(fontWeight: FontWeight.w200);

  TextStyle get withWeightW300 => copyWith(fontWeight: FontWeight.w300);

  TextStyle get withWeightW400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get withWeightW500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get withWeightW600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get withWeightW700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle get withWeightW800 => copyWith(fontWeight: FontWeight.w800);

  TextStyle get withWeightW900 => copyWith(fontWeight: FontWeight.w900);

  /// copy with height

  TextStyle withHeight(double height) => copyWith(height: height);

  TextStyle get withHeight1 => copyWith(height: 1);

  TextStyle get withHeight11 => copyWith(height: 1.1);

  TextStyle get withHeight12 => copyWith(height: 1.2);

  TextStyle get withHeight13 => copyWith(height: 1.3);

  TextStyle get withHeight14 => copyWith(height: 1.4);

  TextStyle get withHeight15 => copyWith(height: 1.5);

  TextStyle get withHeight16 => copyWith(height: 1.6);

  TextStyle get withHeight17 => copyWith(height: 1.7);

  TextStyle get withHeight18 => copyWith(height: 1.8);

  TextStyle get withHeight19 => copyWith(height: 1.9);

  TextStyle get withHeight2 => copyWith(height: 2);

  TextStyle get withHeight21 => copyWith(height: 2.1);

  TextStyle get withHeight22 => copyWith(height: 2.2);

  TextStyle get withHeight23 => copyWith(height: 2.3);

  TextStyle get withHeight24 => copyWith(height: 2.4);

  TextStyle get withHeight25 => copyWith(height: 2.5);

  /// copy with overflow

  TextStyle get withOverflowEllipsis => copyWith(overflow: TextOverflow.ellipsis);
}

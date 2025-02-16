part of 'extension.dart';

extension RectCopyWith on Rect {
  Rect copyWith({
    Offset? center,
    double? width,
    double? height,
  }) =>
      Rect.fromCenter(
        center: center ?? this.center,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  Rect withCenter(Offset center) => Rect.fromCenter(center: center, width: width, height: height);

  Rect withWidth(double width) => Rect.fromCenter(center: center, width: width, height: height);

  Rect withHeight(double height) => Rect.fromCenter(center: center, width: width, height: height);

  Rect withSize(Size size) => Rect.fromCenter(center: center, width: size.width, height: size.height);
}

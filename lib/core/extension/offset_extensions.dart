part of 'extension.dart';

extension OffsetCopyWith on Offset {
  Offset copyWith({
    double? dx,
    double? dy,
  }) =>
      Offset(
        dx ?? this.dx,
        dy ?? this.dy,
      );

  Offset withDx(double dx) => Offset(dx, dy);

  Offset addToX(double val) => Offset(dx + val, dy);

  Offset subtractFromX(double val) => Offset(dx - val, dy);

  Offset withDy(double dy) => Offset(dx, dy);

  Offset addToY(double val) => Offset(dx, dy + val);

  Offset subtractFromY(double val) => Offset(dx, dy - val);

  Offset subtract(Size size) => Offset(dx - size.width, dy - size.height);
}

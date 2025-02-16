import 'dart:math';

extension MakeFixedExtension on num {
  double get fixTo1 {
    final mod = pow(10, 1);
    return (this * mod).round().toDouble() / mod;
  }

  double get fixTo2 {
    final mod = pow(10, 2);
    return (this * mod).round().toDouble() / mod;
  }

  double get fixTo3 {
    final mod = pow(10, 3);
    return (this * mod).round().toDouble() / mod;
  }

  double get fixTo4 {
    final mod = pow(10, 4);
    return (this * mod).round().toDouble() / mod;
  }
}

extension PercentExtension on num {
  T getPercent<T extends num>(num percent) => (T == int ? this * percent ~/ 100 : this * percent / 100) as T;
}

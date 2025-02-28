import 'dart:async';

class DeBouncing {
  DeBouncing(this._duration);

  final Duration _duration;
  Timer? _timer;

  Future<void> handler(Future<void> Function() func) async {
    _timer?.cancel();

    _timer = Timer(_duration, () => func());
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}



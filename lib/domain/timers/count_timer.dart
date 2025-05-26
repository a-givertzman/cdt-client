import 'dart:async';

///
class CountTimer {
  int _count;
  Timer? _timer;
  int _tick = 0;
  final Function(int left) _onTick;
  final Function() _onComplete;
  ///
  CountTimer({
    // общее количество периодов работы таймера
    required int count,
    // текущий период закончился, left - количество оставшихся периодов
    required Function(int left) onTick,
    // когда всее периоды закончились
    required Function() onComplete,
  }): 
    _count = count,
    _onTick = onTick,
    _onComplete = onComplete;
  ///
  void run({int? count}) {
    if (count != null) {
      _count = count;
    }
    _tick = 0;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_tick < _count) {
          _tick++;
          _onTick(_count - _tick);
        } else {
          timer.cancel();
          _onComplete();
        }
      },
    );
  }
  ///
  void cancel() {
    final t = _timer;
    if (t != null) {
      t.cancel();
    }
  }
}

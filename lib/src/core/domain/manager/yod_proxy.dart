import 'package:yod/src/core/domain/manager/kor_manager.dart';

class YodProxy {
  static Set<Kor>? _currentWatchers;

  static void startTracking() {
    _currentWatchers = <Kor>{};
  }

  static Set<Kor>? stopTracking() {
    final watchers = _currentWatchers;
    _currentWatchers = null;
    return watchers;
  }

  static void register(Kor kor) {
    _currentWatchers?.add(kor);
  }
}

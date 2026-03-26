import 'package:flutter/widgets.dart';

import 'yod_proxy.dart';

class Kor<T> extends ChangeNotifier {
  T _value;
  Kor(this._value);

  T get value {
    YodProxy.register(this);
    return _value;
  }

  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => _value.toString();
}

extension KorExtension<T> on T {
  Kor<T> get yor => Kor<T>(this);
}

import 'package:yod/src_manager/core/domain/repositories/yod_interface.dart';

import '../../lifecycle/yod_manager_interface.dart';

class YodInstance extends YodInterface {
  YodInstance._();

  factory YodInstance() => _getInstance ??= YodInstance._();

  static YodInstance? _getInstance;

  final Map<Type, dynamic> _singeltons = {};

  @override
  T register<T>(T dependency) {
    final key = T;
    if (_singeltons.containsKey(key)) {
      return dependency;
    }
    _singeltons[key] = dependency;
    if (dependency is YodManager) {
      dependency.initial();
    }
    return dependency;
  }

  @override
  T resolve<T>() {
    final key = T;
    if (!_singeltons.containsKey(key)) {
      throw Exception('ไม่พบ $key กรุณาใช้ Yod.register() ก่อนเรียกใช้');
    }
    return _singeltons[key];
  }

  @override
  void unregister<T>() {
    final deb = resolve<T>();
    if (deb is YodManager) {
      deb.disponse();
    }
    _singeltons.remove(T);
  }
}

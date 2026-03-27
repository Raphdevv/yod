import 'package:yod/src_manager/core/data/yod_instance.dart';
import 'package:yod/src_manager/core/domain/repositories/yod_interface.dart';

class Yod {
  static final YodInterface _instance = YodInstance();

  static T register<T>(T dependency) {
    return _instance.register<T>(dependency);
  }

  static T resolve<T>() => _instance.resolve<T>();

  static void unregister<T>() => _instance.unregister<T>();
}

abstract class YodInterface {
  T register<T>(T dependency);
  T resolve<T>();
  void unregister<T>();
}

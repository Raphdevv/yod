import 'package:flutter/widgets.dart';
import 'package:yod/src/package_manager/core/domain/manager/kor_manager.dart';
import 'package:yod/src/package_manager/core/domain/manager/yod_proxy.dart';

typedef WidgetCallback = Widget Function();

class YodBuilder extends StatefulWidget {
  const YodBuilder({super.key, required this.builder});

  final WidgetCallback builder;

  @override
  State<YodBuilder> createState() => _YodBuilderState();
}

class _YodBuilderState extends State<YodBuilder> {
  Set<Kor> _detectedWatchers = {};

  @override
  void initState() {
    super.initState();
    _makeConnection();
  }

  void _makeConnection() {
    YodProxy.startTracking();

    widget.builder();

    final found = YodProxy.stopTracking();

    if (found != null) {
      _detectedWatchers = found;
      for (var kor in _detectedWatchers) {
        kor.addListener(_update);
      }
    }
  }

  void _update() => setState(() {});

  @override
  void dispose() {
    for (var kor in _detectedWatchers) {
      kor.removeListener(_update);
    }

    _detectedWatchers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder();
}

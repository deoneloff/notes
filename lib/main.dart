import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:flutter/services.dart' as services;

import 'app.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  configureInjection(Environment.prod);
  services.SystemChrome.setPreferredOrientations(
      [services.DeviceOrientation.portraitUp]).then((_) {
    runApp(App());
  });
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    final timeStamp = '${rec.time.hour}:${rec.time.minute}:${rec.time.second}';
    debugPrint('$timeStamp ${rec.loggerName}: ${rec.message}');
  });
}

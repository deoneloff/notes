import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:flutter/services.dart' as services;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import 'app.dart';
import 'injection.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  // Directory(appDocumentDir.path).delete(recursive: true);
  Hive.init(appDocumentDir.path);
  _registeradapters();
  _setupLogging();
  configureInjection(Environment.prod);
  services.SystemChrome.setPreferredOrientations(
      [services.DeviceOrientation.portraitUp]).then((_) {
    runApp(App());
  });
}

void _registeradapters() {
  // Hive.registerAdapter(UserSettingsDtoAdapter());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    final timeStamp = '${rec.time.hour}:${rec.time.minute}:${rec.time.second}';
    debugPrint('$timeStamp ${rec.loggerName}: ${rec.message}');
  });
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'lang/i18n.dart';
import 'router.gr.dart';

class App extends StatelessWidget {
  final Logger log = Logger('App');
  @override
  Widget build(BuildContext context) {
    log.fine('--> In MaterialApp');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eloff Street Notes',
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: I18nDelegate.supportedLocals,
      builder: ExtendedNavigator(router: Router()),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green[800],
        accentColor: Colors.blueAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

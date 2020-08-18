import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notes/injection.dart';
import 'package:notes/presentation/splash/splash_page.dart';

import 'application/auth/auth_bloc.dart';
import 'lang/i18n.dart';
import 'router.gr.dart';

class App extends StatelessWidget {
  final Logger log = Logger('App');
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eloff Street Notes',
        home: const SplashPage(),
        builder: ExtendedNavigator(router: Router()),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          const I18nDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: I18nDelegate.supportedLocals,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.blue[800],
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
      ),
    );
  }
}

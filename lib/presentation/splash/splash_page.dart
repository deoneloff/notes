import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/lang/i18n.dart';

import '../../router.gr.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void initState() {
    analytics.setCurrentScreen(screenName: "SplashPage");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Logger log = Logger('SplashPage');
    log.fine('--> Splashed!');
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              ExtendedNavigator.of(context).replace(Routes.notesOverviewPage),
          unauthenticated: (_) =>
              ExtendedNavigator.of(context).replace(Routes.signInPage),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Splash'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildSizedbox10(),
            const Expanded(
              child: Text(
                '📝',
                style: TextStyle(
                  fontSize: 120,
                ),
              ),
            ),
            buildSizedbox10(),
            Expanded(
              child: Text(
                '${I18n.of(context).welcome} 😀',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  context.bloc<AuthBloc>().add(const SignedOut());
                }),
            buildSizedbox10(),
          ],
        )),
      ),
    );
  }

  Expanded buildSizedbox10() {
    return const Expanded(
      child: SizedBox(
        height: 10,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:notes/lang/i18n.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Logger log = Logger('SplashPage');
    log.fine('--> Splashed!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(child: Text(I18n.of(context).welcome)),
    );
  }
}

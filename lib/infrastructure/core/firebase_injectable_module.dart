import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @lazySingleton
  Firestore get firestore {
    final Logger log = Logger('FirebaseInjectableModule');
    final String host = Platform.isAndroid ? '10.0.2.2:8080' : 'localhost:8080';
    log.fine(host);
    Firestore.instance.settings(
      host: host,
      sslEnabled: false,
      persistenceEnabled: false,
    );
    return Firestore.instance;
  }
}

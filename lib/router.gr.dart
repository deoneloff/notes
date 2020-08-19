// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'presentation/notes/notes_overview/notes_overview_page.dart';
import 'presentation/sign_in/sign_in_page.dart';
import 'presentation/splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String signInPage = '/sign-in-page';
  static const String notesOverviewPage = '/notes-overview-page';
  static const all = <String>{
    splashPage,
    signInPage,
    notesOverviewPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.notesOverviewPage, page: NotesOverviewPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashPage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignInPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
    NotesOverviewPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            NotesOverviewPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushSignInPage() => push<dynamic>(Routes.signInPage);

  Future<dynamic> pushNotesOverviewPage() =>
      push<dynamic>(Routes.notesOverviewPage);
}

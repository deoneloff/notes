import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import 'presentation/notes/note_form/misc/note_form_page.dart';
import 'presentation/notes/notes_overview/notes_overview_page.dart';
import 'presentation/sign_in/sign_in_page.dart';
import 'presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    // MaterialRoute(page: SplashPage),
    CustomRoute(
      page: SignInPage,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: NotesOverviewPage,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: NoteFormPage,
      fullscreenDialog: true,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      durationInMilliseconds: 500,
    ),
  ],
)
class $Router {}

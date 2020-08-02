import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:notes/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    // CustomRoute(
    //   page: SplashPage,
    //   transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    //   durationInMilliseconds: 5000,
    //   initial: true,
    // ),
  ],
)
class $Router {}

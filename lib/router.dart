import 'package:auto_route/auto_route_annotations.dart';
import 'package:notes/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
  ],
)
class $Router {}

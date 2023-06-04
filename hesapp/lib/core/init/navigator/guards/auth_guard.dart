// ignore_for_file: dead_code

import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool isAuth = false;

    if (isAuth) {
      resolver.next();
    } else {
      // router.replaceNamed("Auth sayfası")
    }
  }
}

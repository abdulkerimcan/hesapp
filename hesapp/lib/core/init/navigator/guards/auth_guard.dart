// ignore_for_file: dead_code

import 'package:auto_route/auto_route.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (LocalManager.instance
        .getStringValue(PreferencesKeys.TOKEN)
        .isNotEmpty) {
      router.replaceNamed(AppRoutes.routeHomeMain);
    } else {
      resolver.next();
    }
  }
}

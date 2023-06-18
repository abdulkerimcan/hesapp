// ignore_for_file: dead_code

import 'package:auto_route/auto_route.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool isAuth = false;
    if (LocalManager.instance
        .getStringValue(PreferencesKeys.TOKEN)
        .isNotEmpty) {
      isAuth = true;
    }
    if (isAuth) {
      router.replaceNamed("/feed");
    } else {
      resolver.next;
    }
  }
}

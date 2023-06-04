import 'package:auto_route/auto_route.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';

class OnBoardGuard extends AutoRouteGuard {
  LocalManager localManager = LocalManager.instance;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool a = localManager.getBoolValue(PreferencesKeys.IS_FIRST_APP);
    if (a) {
      resolver.next();
    } else {
      router.replaceNamed("/auth");
    }
  }
}

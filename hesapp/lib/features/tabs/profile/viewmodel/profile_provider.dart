import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/init/cache/local_manager.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future logOut(BuildContext context) async {
    _changeLoading();

    await Future.delayed(Duration(seconds: 2));
    LocalManager.instance.clearAllSaveFirst().whenComplete(
        () => context.router.replaceNamed(AppRoutes.routeAuthMain));
    _changeLoading();
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/features/auth/onboard/model/onboard_model.dart';

class OnBoardViewModel extends ChangeNotifier {
  List<OnBoardModel> onBoardItems = [];
  LocalManager localManager = LocalManager.instance;
  bool isLoading = false;
  bool isLastIndex = false;
  int currentIndex = 0;

  void changeCurrentIndex(int value) {
    currentIndex = value;
    if (currentIndex == onBoardItems.length - 1) {
      isLastIndex = true;
    } else {
      isLastIndex = false;
    }
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void addItems() {
    onBoardItems.addAll([
      OnBoardModel(
          "Scan and Order",
          "After you scan, you will able to see the menu of the restaurant",
          "assets/lottie/scan.json"),
      OnBoardModel(
          "Your order immediatly will be prepared",
          "Yemeğiniz hızlı bir biçimde hazırlanacaktır",
          "assets/lottie/service.json"),
      OnBoardModel(
          "Pay online or cash",
          "You can pay online on HesApp or you can pay cash",
          "assets/lottie/pay.json")
    ]);
  }

  Future<void> completeOnBoard(BuildContext context) async {
    changeLoading();
    await localManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, false);
    changeLoading();
    if (context.router.canPop()) {
      context.router.pop();
    } else {
      context.router.replaceNamed("/auth");
    }
    notifyListeners();
  }
}

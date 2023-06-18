import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';

import '../../../../features/tabs/menu/model/menu_model.dart';

class UserProvider with ChangeNotifier {
  int _selectedIndex = 0;
  String _username = "";
  String _email = "";
  String _phone = "";

  int get selectedIndex => _selectedIndex;
  String get username => _username;
  String get email => _email;
  String get phone => _phone;

  
  void getUserInformation() {
    _username = LocalManager.instance.getStringValue(PreferencesKeys.USERNAME);
    _email = LocalManager.instance.getStringValue(PreferencesKeys.EMAIL);
    _phone = LocalManager.instance.getStringValue(PreferencesKeys.PHONE);
    notifyListeners();
  }

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


  Map<Product, int> basketProducts = {};
  bool isInCart = false;
  List<Product> get basketItems => basketProducts.keys.toList();

  double get basketTotalMoney {
    if (basketProducts.isEmpty) return 0;
    double total = 0;
    basketProducts.forEach((key, value) {
      total += key.price ?? 0 * value;
    });
    return total;
  }

  int get totalProduct {
    return basketItems.length;
  }

  void addFirstItemToBasket(Product product) {
    basketProducts[product] = 1;
    isInCart = true;
    notifyListeners();
  }

  void increaseProduct(Product product) {
    if (basketProducts[product] == null) {
      addFirstItemToBasket(product);
      return;
    }
    basketProducts[product] = basketProducts[product]! + 1;
    notifyListeners();
  }

  void decreaseProduct(Product product) {
    if (basketProducts[product] == null) {
      isInCart = false;
      return;
    } else {
      basketProducts[product] = basketProducts[product]! - 1;
    }
    if (basketProducts[product] == 0) {
      isInCart = false;
      basketProducts.removeWhere((key, value) => key == product);
    }
    notifyListeners();
  }
}

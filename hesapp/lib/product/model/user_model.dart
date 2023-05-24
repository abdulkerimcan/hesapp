import 'package:flutter/material.dart';
import 'package:hesapp/features/home/model/product_model.dart';

class User extends ChangeNotifier {
  Map<Product, int> basketProducts = {};
  bool isInCart = false;
  List<Product> get basketItems => basketProducts.keys.toList();

  double get basketTotalMoney {
    if (basketProducts.isEmpty) return 0;
    double total = 0;
    basketProducts.forEach((key, value) {
      total += key.price! * value;
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

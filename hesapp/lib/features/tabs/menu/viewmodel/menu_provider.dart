import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import '../model/menu_model.dart';
import '../service/menu_service.dart';

class MenuProvider extends ChangeNotifier {
  final IMenuService menuService;
  List<MenuModel> menus = [];
  List<Product> products = [];
  bool isLoading = false;
  int restaurantId =
      LocalManager.instance.getIntValue(PreferencesKeys.TABLE_ID);

  MenuProvider(this.menuService) {
    _fetch(restaurantId).whenComplete(() => getAllProducts());
  }

  void getProducts(MenuModel menu) {
    products = menu.items ?? [];
    notifyListeners();
  }

  void getAllProducts() {
    List<Product> allProducts = [];
    for (var menu in menus) {
      if (menu.items != null) {
        allProducts.addAll(menu.items!);
      }
    }
    products = allProducts;
    notifyListeners();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch(int restaurantId) async {
    _changeLoading();
    await Future.delayed(Duration(seconds: 2));
    menus = await fetchProduct(restaurantId);
    _changeLoading();
  }

  Future<List<MenuModel>> fetchProduct(int restaurantId) async {
    return (await menuService.getMenu(restaurantId)) ?? [];
  }
}

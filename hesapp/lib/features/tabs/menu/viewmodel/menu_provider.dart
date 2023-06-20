import 'package:flutter/material.dart';
import '../model/menu_model.dart';
import '../service/menu_service.dart';

class MenuProvider extends ChangeNotifier {
  final IMenuService menuService;
  List<MenuModel> menus = [];
  List<Product> products = [];
  bool isLoading = false;
  int restaurantId = 1;

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
    menus = await fetchProduct(restaurantId);
    _changeLoading();
  }

  Future<List<MenuModel>> fetchProduct(int restaurantId) async {
    return (await menuService.getMenu(restaurantId)) ?? [];
  }
}

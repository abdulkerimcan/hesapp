import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../core/constants/enums/local_keys_enum.dart';
import '../../../../core/init/cache/local_manager.dart';
import '../model/menu_model.dart';

abstract class IMenuService {
  final path = "menu/categories/";
  final Dio dio;

  IMenuService(this.dio);

  Future<List<MenuModel>?> getMenu(int restaurantId);
}

class MenuService extends IMenuService {
  MenuService(super.dio);

  @override
  Future<List<MenuModel>?> getMenu(int restaurantId) async {
    final response = await dio.get("$path$restaurantId",
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${LocalManager.instance.getStringValue(PreferencesKeys.TOKEN)}"
        }));

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List<dynamic>) {
        final map = jsonBody
            .map((e) => MenuModel.fromJson(e))
            .whereType<MenuModel>()
            .toList();
        return map;
      }
    }
    return null;
  }
}

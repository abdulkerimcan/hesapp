import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/features/tabs/cart/model/cart_order_request_model.dart';
import 'package:hesapp/features/tabs/cart/model/cart_order_response_model.dart';
import '../../../../core/init/cache/local_manager.dart';

abstract class ICartOrderService {
  final String path = "order";
  final Dio dio;
  ICartOrderService(this.dio);
  Future<CartOrderResponseModel?> order(CartOrderModel cartOrderModel);
}

class CartOrderService extends ICartOrderService {
  CartOrderService(super.dio);

  @override
  Future<CartOrderResponseModel?> order(CartOrderModel cartOrderModel) async {
    final response = await dio.post(path,
        data: cartOrderModel,
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${LocalManager.instance.getStringValue(PreferencesKeys.TOKEN)}"
          },
        ));

    if (response.statusCode == HttpStatus.created) {
      return CartOrderResponseModel.fromJson(response.data);
    }
    return null;
  }
}

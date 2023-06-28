import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hesapp/features/tabs/payment/model/payment_model.dart';

import '../../../../core/constants/enums/local_keys_enum.dart';
import '../../../../core/init/cache/local_manager.dart';

abstract class IPaymentService {
  final path = "tables/";
  final Dio dio;
  IPaymentService(this.dio);

  Future<List<Orders>?> getBill(int table_id);
}

class PaymentService extends IPaymentService {
  PaymentService(super.dio);

  @override
  Future<List<Orders>?> getBill(int table_id) async {
    final response = await dio.get("$path$table_id",
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
            .map((e) => PaymentResponseModel.fromJson(e))
            .whereType<PaymentResponseModel>()
            .toList();

        var filteredData =
            map.first.users?.where((element) => element.id == 1).toList();

        if (filteredData != null && filteredData.isNotEmpty) {
          var orders = filteredData.first.orders;
          return orders;
        }
      }
    }
    return null;
  }
}

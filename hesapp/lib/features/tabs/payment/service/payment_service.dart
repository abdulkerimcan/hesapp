import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hesapp/features/tabs/payment/model/payment_model.dart';

import '../../../../core/constants/enums/local_keys_enum.dart';
import '../../../../core/init/cache/local_manager.dart';

abstract class IPaymentService {
  final path = "order/customer-history?per_page=100";
  final Dio dio;
  IPaymentService(this.dio);

  Future<PaymentResponseModel?> getBill();
}

class PaymentService extends IPaymentService {
  PaymentService(super.dio);

  @override
  Future<PaymentResponseModel?> getBill() async {
    final response = await dio.get(path,
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${LocalManager.instance.getStringValue(PreferencesKeys.TOKEN)}"
        }));
      print("object");

    if (response.statusCode == HttpStatus.ok) {
      print("object");
      return PaymentResponseModel.fromJson(response.data);
    }
    return null;
  }
}

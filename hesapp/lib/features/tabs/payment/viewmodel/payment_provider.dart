import 'package:flutter/material.dart';

import 'package:hesapp/features/tabs/payment/model/payment_model.dart';
import 'package:hesapp/features/tabs/payment/service/payment_service.dart';

class PaymentProvider extends ChangeNotifier {
  final IPaymentService paymentService;
  bool isLoading = false;
  PaymentResponseModel? model = PaymentResponseModel();
  List<PaymentResponseModel?> products = [];
  List<OrderItems>? orderItems = [];
  List<Orders>? orders = [];

  PaymentProvider(this.paymentService) {
    _getBill().whenComplete(() => getOrders());
  }
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void getOrders() {
    if (model != null) {
      orders = model?.orders;
      orders?.forEach((element) {
        orderItems = element.orderItems;
      });
    }
    notifyListeners();
  }

  Future<void> _getBill() async {
    _changeLoading();
    model = await getBill();
    _changeLoading();
  }

  Future<PaymentResponseModel?> getBill() async {
    return (await paymentService.getBill());
  }
}

import 'package:flutter/material.dart';

import 'package:hesapp/features/tabs/payment/model/payment_model.dart';
import 'package:hesapp/features/tabs/payment/service/payment_service.dart';

class PaymentProvider extends ChangeNotifier {
  final IPaymentService paymentService;
  bool isLoading = false;
  List<Orders> orders = [];
  List<OrderItems> orderItems = [];
  PaymentProvider(this.paymentService) {
    _getBill().whenComplete(() => getAllOrderItems());
  }
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void getAllOrderItems() {
    List<OrderItems> allOrderItems = [];
    for (var order in orders) {
      if (order.orderItems != null) {
        allOrderItems.addAll(order.orderItems!);
      }
    }
    orderItems = allOrderItems;
    notifyListeners();
  }

  Future<void> _getBill() async {
    _changeLoading();
    orders = await getBill();
    _changeLoading();
    getAllOrderItems();
  }

  Future<List<Orders>> getBill() async {
    return (await paymentService.getBill()) ?? [];
  }
}

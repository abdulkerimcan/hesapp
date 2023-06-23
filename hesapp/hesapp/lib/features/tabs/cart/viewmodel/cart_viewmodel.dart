import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/features/tabs/cart/model/cart_order_request_model.dart';
import 'package:hesapp/features/tabs/cart/service/cart_service.dart';
import 'package:hesapp/product/widget/loading/loading_circular.dart';
import 'package:provider/provider.dart';

import '../view/cart_view.dart';

abstract class CartViewModel extends LoadingStateful<CartView> {
  late ICartOrderService cartOrderService;

  @override
  void initState() {
    super.initState();
    cartOrderService = CartOrderService(NetworkManager.instance.service);
  }

  Future<void> order() async {
    changeLoading();
    List<OrderItems>? orderItems = [];
    context.read<UserProvider>().basketProducts.forEach((key, value) {
      var item = OrderItems(menuItemId: key.id, quantity: value);
      orderItems.add(item);
    });
    
    final response = await cartOrderService.order(
        CartOrderModel(restaurantId: 1, tableId: 1, orderItems: orderItems));

    if (response != null) {
      context.read<UserProvider>().clearBasket();
    }
    changeLoading();
  }
}

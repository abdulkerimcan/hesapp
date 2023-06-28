class CartOrderModel {
  int? restaurantId;
  int? tableId;
  List<OrderItems>? orderItems;

  CartOrderModel({this.restaurantId, this.tableId, this.orderItems});

  CartOrderModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    tableId = json['table_id'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['table_id'] = this.tableId;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? menuItemId;
  int? quantity;

  OrderItems({this.menuItemId, this.quantity});

  OrderItems.fromJson(Map<String, dynamic> json) {
    menuItemId = json['menu_item_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_item_id'] = this.menuItemId;
    data['quantity'] = this.quantity;
    return data;
  }
}

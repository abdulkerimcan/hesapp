class CartOrderResponseModel {
  int? id;
  int? userId;
  int? restaurantId;
  int? tableId;
  String? status;
  double? totalAmount;
  String? orderTime;
  List<OrderItems>? orderItems;
  List<Null>? paymentTransactions;

  CartOrderResponseModel(
      {this.id,
      this.userId,
      this.restaurantId,
      this.tableId,
      this.status,
      this.totalAmount,
      this.orderTime,
      this.orderItems,
      this.paymentTransactions});

  CartOrderResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    tableId = json['table_id'];
    status = json['status'];
    totalAmount = json['total_amount'];
    orderTime = json['order_time'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['table_id'] = this.tableId;
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    data['order_time'] = this.orderTime;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? orderId;
  int? menuItemId;
  String? menuItemName;
  int? quantity;
  double? price;

  OrderItems(
      {this.orderId,
      this.menuItemId,
      this.menuItemName,
      this.quantity,
      this.price});

  OrderItems.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    menuItemId = json['menu_item_id'];
    menuItemName = json['menu_item_name'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['menu_item_id'] = this.menuItemId;
    data['menu_item_name'] = this.menuItemName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}

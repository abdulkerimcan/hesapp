class PaymentResponseModel {
  int? id;
  int? restaurantId;
  String? name;
  List<Users>? users;

  PaymentResponseModel({this.id, this.restaurantId, this.name, this.users});

  PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    name = json['name'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['name'] = this.name;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? username;
  String? email;
  String? role;
  String? phone;
  List<Orders>? orders;

  Users(
      {this.id, this.username, this.email, this.role, this.phone, this.orders});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone'] = this.phone;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? userId;
  int? restaurantId;
  int? tableId;
  String? status;
  double? totalAmount;
  String? orderTime;
  Null deliveryTime;
  List<OrderItems>? orderItems;
  List<Null>? paymentTransactions;

  Orders(
      {this.id,
      this.userId,
      this.restaurantId,
      this.tableId,
      this.status,
      this.totalAmount,
      this.orderTime,
      this.deliveryTime,
      this.orderItems,
      this.paymentTransactions});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    tableId = json['table_id'];
    status = json['status'];
    totalAmount = json['total_amount'];
    orderTime = json['order_time'];
    deliveryTime = json['delivery_time'];
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
    data['delivery_time'] = this.deliveryTime;
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

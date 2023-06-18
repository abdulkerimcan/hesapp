class MenuModel {
  int? id;
  int? restaurantId;
  String? name;
  List<Product>? items;

  MenuModel({this.id, this.restaurantId, this.name, this.items});

  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Product>[];
      json['items'].forEach((v) {
        items!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restaurant_id'] = restaurantId;
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Product {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  double? price;
  String? image;

  Product(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.price,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
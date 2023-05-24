class Product {
  String? id;
  String? name;
  String? image;
  int? total;
  int? price;

  Product({this.id, this.name, this.image, this.total, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    total = json['total'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['total'] = this.total;
    data['price'] = this.price;
    return data;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.id == id &&
        o.name == name &&
        o.image == image &&
        o.total == total &&
        o.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        total.hashCode ^
        price.hashCode;
  }
}
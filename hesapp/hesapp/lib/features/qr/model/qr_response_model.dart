class QrResponseModel {
  int? restaurantId;
  int? tableId;

  QrResponseModel({this.restaurantId, this.tableId});

  QrResponseModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    tableId = json['table_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['table_id'] = this.tableId;
    return data;
  }
}
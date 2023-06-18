class UpdateProfileRequestModel {
  String? username;
  String? phone;
  String? password;

  UpdateProfileRequestModel({this.username, this.phone, this.password});

  UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}

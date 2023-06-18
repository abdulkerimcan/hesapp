
class User {

  int? id;
  String? username;
  String? email;
  String? role;
  String? phone;

  User({this.id, this.username, this.email, this.role, this.phone});
  
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone'] = this.phone;
    return data;
  }


  
}

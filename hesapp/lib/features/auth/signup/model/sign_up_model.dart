import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? username;
  String? email;
  String? password;
  String? phone;

  SignUpModel({this.username, this.email, this.password, this.phone});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpModelToJson(this);
  }
}

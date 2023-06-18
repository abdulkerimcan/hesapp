import 'package:json_annotation/json_annotation.dart';

part 'login_model_request.g.dart';

@JsonSerializable()
class LoginModelRequest {
  String? email;
  String? password;

  LoginModelRequest({this.email, this.password});

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginModelRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginModelRequestToJson(this);
  }
}

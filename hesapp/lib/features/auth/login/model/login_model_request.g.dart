// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModelRequest _$LoginModelRequestFromJson(Map<String, dynamic> json) =>
    LoginModelRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginModelRequestToJson(LoginModelRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

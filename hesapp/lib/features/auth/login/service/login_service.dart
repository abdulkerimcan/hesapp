import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hesapp/features/auth/login/model/login_model_request.dart';
import 'package:hesapp/features/auth/login/model/login_model_response.dart';

abstract class ILoginService {
  final String path = "auth/login";
  final Dio dio;
  ILoginService(this.dio);

  Future<LoginModelResponse?> login(LoginModelRequest loginModelRequest);
}

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<LoginModelResponse?> login(LoginModelRequest loginModelRequest) async {
    final response = await dio.post(
      path,
      data: loginModelRequest,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          
        },
      ),
    );

    
    if (response.statusCode == HttpStatus.ok) {
      return LoginModelResponse.fromJson(response.data);
    }
    return null;
  }
}

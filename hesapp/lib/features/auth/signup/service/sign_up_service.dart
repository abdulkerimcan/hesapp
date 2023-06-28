import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hesapp/features/auth/signup/model/sign_up_model.dart';
import 'package:hesapp/features/auth/signup/model/sign_up_response.dart';

abstract class ISignUpService {
  final path = "auth/register";
  final Dio dio;

  ISignUpService(this.dio);

  Future<SignUpResponseModel?> register(SignUpModel signUpModel);
}

class SignUpService extends ISignUpService {
  SignUpService(super.dio);

  @override
  Future<SignUpResponseModel?> register(SignUpModel signUpModel) async {
    final response = await dio.post(path,
        data: signUpModel,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));
    if (response.statusCode == HttpStatus.created) {
      return SignUpResponseModel.fromJson(response.data);
    }
    return null;
  }
}

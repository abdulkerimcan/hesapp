import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/data/model/user_model.dart';

abstract class IUserService {
  final path = "customer";
  final Dio dio;

  IUserService(this.dio);

  Future<User?> getUser();
}

class UserService extends IUserService {
  UserService(super.dio);

  @override
  Future<User?> getUser() async {
    final response = await dio.get(path,
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${LocalManager.instance.getStringValue(PreferencesKeys.TOKEN)}"
        }));

    if (response.statusCode == HttpStatus.ok) {
      return User.fromJson(response.data);
    }
    return null;
  }
}

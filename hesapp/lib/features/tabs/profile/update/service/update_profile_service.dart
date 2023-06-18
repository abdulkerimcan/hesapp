import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hesapp/features/tabs/profile/update/model/update_profile_request.dart';
import 'package:hesapp/features/tabs/profile/update/model/update_profile_response.dart';

import '../../../../../core/constants/enums/local_keys_enum.dart';
import '../../../../../core/init/cache/local_manager.dart';

abstract class IUpdateProfileService {
  final path = "customer";
  final Dio dio;

  IUpdateProfileService(this.dio);

  Future<UpdateProfileResponseModel?> updateUser(UpdateProfileRequestModel user);
}

class UpdateProfileService extends IUpdateProfileService {
  UpdateProfileService(super.dio);

  @override
  Future<UpdateProfileResponseModel?> updateUser(UpdateProfileRequestModel user) async {
    final response = await dio.put(path, data: user,options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${LocalManager.instance.getStringValue(PreferencesKeys.TOKEN)}"
        }));

    if (response.statusCode == HttpStatus.ok) {
      return UpdateProfileResponseModel.fromJson(response.data);
    }
    return null;
  }
}

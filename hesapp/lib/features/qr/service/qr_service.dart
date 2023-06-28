import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hesapp/features/qr/model/qr_response_model.dart';

import '../../../core/constants/enums/local_keys_enum.dart';
import '../../../core/init/cache/local_manager.dart';

abstract class IQrService {
  final String path = "qr/table/";
  final Dio dio;

  IQrService(this.dio);

  Future<QrResponseModel?> scan(String id);
}

class QrService extends IQrService {
  QrService(super.dio);

  @override
  Future<QrResponseModel?> scan(String id) async {
    final response = await dio.get("$path$id",
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer ${LocalManager.instance.getStringValue(PreferencesKeys.TOKEN)}"
        }));

    if (response.statusCode == HttpStatus.ok) {
      return QrResponseModel.fromJson(response.data);
    }
    return null;
  }
}

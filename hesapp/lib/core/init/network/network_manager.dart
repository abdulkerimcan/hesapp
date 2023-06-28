import 'package:dio/dio.dart';

class NetworkManager {
  late final Dio _dio;
  NetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: "https://hesapp.link/"));
  }

  static NetworkManager instance = NetworkManager._();

  Dio get service => _dio;

  void addBaserHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }
}

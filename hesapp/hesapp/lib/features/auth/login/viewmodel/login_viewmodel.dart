import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/features/auth/login/model/login_model_request.dart';
import 'package:hesapp/features/auth/login/service/login_service.dart';
import 'package:hesapp/features/auth/login/view/login_view.dart';
import 'package:hesapp/product/widget/loading/loading_circular.dart';

abstract class LoginViewModel extends LoadingStateful<LoginView> {
  late final ILoginService loginService;

  @override
  void initState() {
    super.initState();
    loginService = LoginService(NetworkManager.instance.service);
    NetworkManager.instance.addBaserHeaderToToken('token');
  }

  Future<void> login(String email, String password) async {
    changeLoading();
    try {
      final response = await loginService
          .login(LoginModelRequest(email: email, password: password));

      if (response != null) {
        LocalManager.instance
            .setStringValue(PreferencesKeys.TOKEN, response.accessToken ?? '');
        context.router.replaceNamed(AppRoutes.routeQRMain);
      }
    } catch (error) {
      if (error is DioException) {}
    }
    changeLoading();
  }
}



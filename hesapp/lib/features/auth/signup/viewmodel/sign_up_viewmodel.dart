import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/features/auth/signup/model/sign_up_model.dart';
import 'package:hesapp/features/auth/signup/service/sign_up_service.dart';
import 'package:hesapp/features/auth/signup/view/signup_view.dart';
import 'package:hesapp/product/widget/loading/loading_circular.dart';

abstract class SignUpViewModel extends LoadingStateful<SignupView> {
  late ISignUpService signUpService;

  @override
  void initState() {
    super.initState();
    signUpService = SignUpService(NetworkManager.instance.service);
  }

  Future<void> register(
      String username, String email, String password, String phone) async {
    changeLoading();
    try {
      final response = await signUpService.register(SignUpModel(
          email: email, password: password, phone: phone, username: username));

      if (response != null) {
        LocalManager.instance
            .setStringValue(PreferencesKeys.TOKEN, response.accessToken ?? "")
            .whenComplete(() {
          print(LocalManager.instance.getStringValue(PreferencesKeys.TOKEN));
          context.router.replaceNamed(AppRoutes.routeHomeMain);
        });
      } else {}
    } catch (error) {
      if (error is DioException) {}
    }

    changeLoading();
  }
}

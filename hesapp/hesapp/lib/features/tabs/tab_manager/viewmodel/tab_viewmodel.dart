import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:hesapp/core/init/data/service/user_service.dart';
import 'package:hesapp/product/widget/loading/loading_circular.dart';
import 'package:provider/provider.dart';

import '../view/tab_view.dart';

abstract class TabViewModel extends LoadingStateful<TabView> {
  late final IUserService userService;

  @override
  void initState() {
    super.initState();
    userService = UserService(NetworkManager.instance.service);
    getProfileData();
  }

  Future<void> getProfileData() async {
    changeLoading();
    final response = await userService.getUser();

    if (response != null) {
      await LocalManager.instance
          .setStringValue(PreferencesKeys.EMAIL, response.email ?? "");
      await LocalManager.instance
          .setStringValue(PreferencesKeys.PHONE, response.phone ?? "");
      await LocalManager.instance
          .setIntValue(PreferencesKeys.ID, response.id ?? 0);
      await LocalManager.instance
          .setStringValue(PreferencesKeys.USERNAME, response.username ?? "");
      await LocalManager.instance
          .setStringValue(PreferencesKeys.ROLE, response.role ?? "");

      context.read<UserProvider>().getUserInformation();
    }

    changeLoading();
  }
}

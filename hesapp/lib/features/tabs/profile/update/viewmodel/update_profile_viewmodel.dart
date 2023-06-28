import 'package:auto_route/auto_route.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/features/tabs/profile/update/model/update_profile_request.dart';
import 'package:hesapp/features/tabs/profile/update/service/update_profile_service.dart';
import 'package:hesapp/features/tabs/profile/update/view/update_profile_view.dart';
import 'package:hesapp/product/widget/loading/loading_circular.dart';
import 'package:provider/provider.dart';

import '../../../../../core/init/data/viewmodel/user_provider.dart';

abstract class UpdateProfileViewModel
    extends LoadingStateful<UpdateProfileView> {
  late IUpdateProfileService profileUpdateService;

  @override
  void initState() {
    super.initState();
    profileUpdateService =
        UpdateProfileService(NetworkManager.instance.service);
  }

  Future<void> update(String username, String phone, String password) async {
    changeLoading();
    final response = await profileUpdateService.updateUser(
        UpdateProfileRequestModel(
            username: username, password: password, phone: phone));

    if (response != null) {
      LocalManager.instance.setStringValue(PreferencesKeys.PHONE, phone);
      LocalManager.instance.setStringValue(PreferencesKeys.USERNAME, username);
      context.read<UserProvider>().getUserInformation();
      context.router.pop();
    }
    changeLoading();
  }
}

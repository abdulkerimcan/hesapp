import 'package:auto_route/auto_route.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/features/qr/service/qr_service.dart';
import 'package:hesapp/features/qr/view/scanner.dart';
import 'package:hesapp/product/widget/loading/loading_circular.dart';

import '../../../core/constants/enums/local_keys_enum.dart';
import '../../../core/init/cache/local_manager.dart';

abstract class QrViewModel extends LoadingStateful<Scanner> {
  late final IQrService qrService;
  @override
  void initState() {
    super.initState();
    qrService = QrService(NetworkManager.instance.service);
  }

  Future<void> scan(String id) async {
    changeLoading();
    final response = await qrService.scan(id);

    if (response != null) {
      LocalManager.instance.setIntValue(
          PreferencesKeys.RESTAURANT_ID, response.restaurantId ?? 0);

      LocalManager.instance
          .setIntValue(PreferencesKeys.TABLE_ID, response.tableId ?? 0)
          .whenComplete(
              () => context.router.replaceNamed(AppRoutes.routeHomeMain));
    }
    changeLoading();
  }
}

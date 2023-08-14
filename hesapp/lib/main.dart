import 'package:flutter/material.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/core/init/network/network_manager.dart';
import 'package:hesapp/features/auth/onboard/viewmodel/onboard_provider.dart';
import 'package:hesapp/core/init/theme/app_theme.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:hesapp/features/tabs/payment/service/payment_service.dart';
import 'package:hesapp/features/tabs/payment/viewmodel/payment_provider.dart';
import 'package:hesapp/features/tabs/profile/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';
import 'features/tabs/menu/service/menu_service.dart';
import 'features/tabs/menu/viewmodel/menu_provider.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardViewModel()),
    ChangeNotifierProvider(
        create: (context) =>
            PaymentProvider(PaymentService(NetworkManager.instance.service))),
    ChangeNotifierProvider(
        create: (context) =>
            MenuProvider(MenuService(NetworkManager.instance.service))),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(
        create: (context) =>
            ProfileProvider()),
  ], child: MyApp()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalManager.preferencesInit();
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}

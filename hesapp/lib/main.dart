import 'package:flutter/material.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/features/auth/onboard/viewmodel/onboard_view_model.dart';
import 'package:hesapp/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:hesapp/product/model/user_model.dart';
import 'package:hesapp/core/init/theme/app_theme.dart';
import 'package:hesapp/features/home/viewmodel/selected_card_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
    ),
    ChangeNotifierProvider(create: (context) => OnBoardViewModel()),
    ChangeNotifierProvider(create: (context) => User()),
    ChangeNotifierProvider(create: (context) => SelectedIndexProvider())
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

    // .router(
    //   routeInformationProvider: _appRouter.routeInfoProvider(),
    //   routerDelegate: _appRouter.delegate(),
    //   routeInformationParser: _appRouter.defaultRouteParser(),
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: AppTheme.darkTheme,
    // );
  }
}

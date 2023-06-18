import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/init/navigator/guards/auth_guard.dart';
import 'package:hesapp/core/init/navigator/guards/onboard_guard.dart';
import 'package:hesapp/features/auth/auth_main_view.dart';
import 'package:hesapp/features/auth/login/view/login_view.dart';
import 'package:hesapp/features/auth/signup/view/signup_view.dart';
import 'package:hesapp/features/tabs/cart/view/cart_view.dart';
import 'package:hesapp/features/tabs/menu/details/view/details_view.dart';
import 'package:hesapp/features/tabs/menu/view/menu_view.dart';
import 'package:hesapp/features/tabs/profile/view/profile_view.dart';
import 'package:hesapp/features/tabs/profile/update/view/update_profile_view.dart';
import 'package:hesapp/features/tabs/tab_manager/view/tab_view.dart';

import '../../../features/auth/onboard/view/onboard_view.dart';
import '../../../features/tabs/menu/model/menu_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        ///OnBoard
        AutoRoute(
            initial: true,
            page: OnboardViewRoute.page,
            path: AppRoutes.routeOnBoardMain,
            guards: [OnBoardGuard()]),

        ///Auth
        AutoRoute(
          guards: [AuthGuard()],
          page: AuthViewRoute.page, path: AppRoutes.routeAuthMain, children: [
          AutoRoute(page: LoginViewRoute.page, path: AppRoutes.routeAuthLogin,initial: true),
          AutoRoute(page: SignupViewRoute.page, path: AppRoutes.routeAuthSignUp,),
        ]),

        //Feed
        AutoRoute(
          page: TabViewRoute.page, path: AppRoutes.routeHomeMain, children: [
          AutoRoute(
            page: MenuViewRoute.page,
            path: AppRoutes.routeHomeMenu,
            initial: true,
          ),
          AutoRoute(page: CartViewRoute.page, path: AppRoutes.routeHomeCart),
          AutoRoute(page: ProfileViewRoute.page, path: AppRoutes.routeHomeProfile),
        ]),
        //profile edit
        AutoRoute(page: UpdateProfileViewRoute.page, path: AppRoutes.routeEditMain),

        //product details
        AutoRoute(page: DetailsViewRoute.page, path: AppRoutes.routeDetailsMain)
      ];
}

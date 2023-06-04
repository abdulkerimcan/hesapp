import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/init/navigator/guards/onboard_guard.dart';
import 'package:hesapp/features/auth/auth_main_view.dart';
import 'package:hesapp/features/auth/login/view/login_view.dart';
import 'package:hesapp/features/auth/signup/signup_view.dart';
import 'package:hesapp/features/cart/view/cart_view.dart';
import 'package:hesapp/features/details/view/details_view.dart';
import 'package:hesapp/features/home/model/product_model.dart';
import 'package:hesapp/features/home/view/home.dart';
import 'package:hesapp/features/profile/view/profile_view.dart';
import 'package:hesapp/features/profile/view/update_profile_view.dart';
import 'package:hesapp/features/tabs/tab_view.dart';

import '../../../features/auth/onboard/view/onboard_view.dart';

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
            path: "/onboard",
            guards: [OnBoardGuard()]),

        ///Auth
        AutoRoute(page: AuthViewRoute.page, path: "/auth", children: [
          AutoRoute(page: SignupViewRoute.page, path: "signup", initial: true),
          AutoRoute(page: LoginViewRoute.page, path: "login"),
        ]),

        //Feed
        AutoRoute(page: TabViewRoute.page, path: "/home", children: [
          AutoRoute(
            page: HomepageViewRoute.page,
            path: "feed",
            initial: true,
          ),
          AutoRoute(page: CartViewRoute.page, path: "cart"),
          AutoRoute(page: ProfileViewRoute.page, path: "profile"),
        ]),
        //profile edit
        AutoRoute(page: UpdateProfileViewRoute.page, path: "/edit"),

        //product details
        AutoRoute(page: DetailsViewRoute.page, path: "/details")
      ];
}

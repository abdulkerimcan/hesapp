// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    OnboardViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardView(),
      );
    },
    AuthViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SignupViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupView(),
      );
    },
    UpdateProfileViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateProfileView(),
      );
    },
    ProfileViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    TabViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabView(),
      );
    },
    CartViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartView(),
      );
    },
    DetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsView(
          key: args.key,
          product: args.product,
        ),
      );
    },
    MenuViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuView(),
      );
    },
  };
}

/// generated route for
/// [OnboardView]
class OnboardViewRoute extends PageRouteInfo<void> {
  const OnboardViewRoute({List<PageRouteInfo>? children})
      : super(
          OnboardViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthView]
class AuthViewRoute extends PageRouteInfo<void> {
  const AuthViewRoute({List<PageRouteInfo>? children})
      : super(
          AuthViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<void> {
  const LoginViewRoute({List<PageRouteInfo>? children})
      : super(
          LoginViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupView]
class SignupViewRoute extends PageRouteInfo<void> {
  const SignupViewRoute({List<PageRouteInfo>? children})
      : super(
          SignupViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateProfileView]
class UpdateProfileViewRoute extends PageRouteInfo<void> {
  const UpdateProfileViewRoute({List<PageRouteInfo>? children})
      : super(
          UpdateProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfileViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileViewRoute extends PageRouteInfo<void> {
  const ProfileViewRoute({List<PageRouteInfo>? children})
      : super(
          ProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabView]
class TabViewRoute extends PageRouteInfo<void> {
  const TabViewRoute({List<PageRouteInfo>? children})
      : super(
          TabViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartView]
class CartViewRoute extends PageRouteInfo<void> {
  const CartViewRoute({List<PageRouteInfo>? children})
      : super(
          CartViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailsView]
class DetailsViewRoute extends PageRouteInfo<DetailsViewRouteArgs> {
  DetailsViewRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsViewRoute.name,
          args: DetailsViewRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsViewRoute';

  static const PageInfo<DetailsViewRouteArgs> page =
      PageInfo<DetailsViewRouteArgs>(name);
}

class DetailsViewRouteArgs {
  const DetailsViewRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'DetailsViewRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [MenuView]
class MenuViewRoute extends PageRouteInfo<void> {
  const MenuViewRoute({List<PageRouteInfo>? children})
      : super(
          MenuViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

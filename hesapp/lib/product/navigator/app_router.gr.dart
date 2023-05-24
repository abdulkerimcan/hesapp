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
    HomepageViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomepageView(),
      );
    }
  };
}

/// generated route for
/// [HomepageView]
class HomepageViewRoute extends PageRouteInfo<void> {
  const HomepageViewRoute({List<PageRouteInfo>? children})
      : super(
          HomepageViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomepageViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

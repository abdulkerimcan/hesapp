
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:hesapp/features/home/view/home.dart';

part 'app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: "Route")      
class AppRouter extends _$AppRouter {      
   @override
  RouteType get defaultRouteType => const RouteType.material();
 @override      
 List<AutoRoute> get routes => [      
  /// routes go here
        AutoRoute(page: HomepageViewRoute.page, path: "/", initial: true),
        
        
  ];    
}    
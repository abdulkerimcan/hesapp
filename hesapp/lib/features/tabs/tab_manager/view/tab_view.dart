import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/features/tabs/tab_manager/viewmodel/tab_viewmodel.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends TabViewModel {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        MenuViewRoute(),
        PaymentViewRoute(),
        CartViewRoute(),
        ProfileViewRoute()
      ],
      builder: (context, child, tabController) {
        return SafeArea(
            child: Scaffold(
          body: child,
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildFAB(),
          bottomNavigationBar: _buildBottomAppBar(tabController),
        ));
      },
    );
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      backgroundColor: const Color(0xffffeb3f),
      onPressed: () {},
      child: Icon(
        Icons.qr_code_scanner_outlined,
        size: context.height * 0.05,
      ),
    );
  }

  BottomAppBar _buildBottomAppBar(TabController controller) {
    return BottomAppBar(
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child:
          TabBar(controller: controller, indicatorColor: Colors.yellow, tabs: [
        const Tab(
          icon: Icon(Icons.restaurant_outlined),
        ),
        Tab(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.payments_outlined),
              Text(
                "",
                style: Theme.of(context).textTheme.bodySmall,
              ), // total payment will be shown here
            ],
          ),
        ),
        Tab(
          icon: Stack(
            children: [
              const Icon(Icons.shopping_basket_outlined),
              Positioned(
                  top: 0,
                  right: 0,
                  height: 12,
                  width: 12,
                  child: _buildCircleAvatar())
            ],
          ),
        ),
        const Tab(
          icon: Icon(Icons.person_outline),
        ),
      ]),
    );
  }

  Widget _buildCircleAvatar() {
    return context.watch<UserProvider>().basketItems.isNotEmpty
        ? CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text(context.watch<UserProvider>().totalProduct.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.black)),
          )
        : const SizedBox.shrink();
  }
}

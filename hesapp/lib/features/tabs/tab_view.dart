import 'package:flutter/material.dart';
import 'package:hesapp/features/cart/view/cart_view.dart';
import 'package:hesapp/features/home/view/home.dart';
import 'package:hesapp/product/model/user_model.dart';
import 'package:provider/provider.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: SafeArea(
            child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildFAB(),
          bottomNavigationBar: _buildBottomAppBar(),
          body: const TabBarView(children: [
            HomepageView(),
            HomepageView(),
            CartView(),
            HomepageView(),
          ]),
        )));
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.yellow,
      onPressed: () {},
      child: const Icon(
        Icons.qr_code_scanner_outlined,
        size: 40,
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child: TabBar(indicatorColor: Colors.yellow, tabs: [
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
              ),
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
    return context.watch<User>().basketItems.isNotEmpty
        ? CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text(context.watch<User>().totalProduct.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.black)),
          )
        : const SizedBox.shrink();
  }
}

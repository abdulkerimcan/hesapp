import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';
import '../viewmodel/menu_provider.dart';
import '../widget/product_cart.dart';

@RoutePage()
class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = (context.height - kToolbarHeight) / 2;
    final double itemWidth = context.width / 2;

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          elevation: 0,
          title: _header(),
        )
      ],
      body: Padding(
        padding: context.paddingNormal,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: context.paddingLowVertical,
            child: _categories(),
          ),
          Expanded(child: _productGridView(context, itemWidth, itemHeight))
        ]),
      ),
    ));
  }

  GridView _productGridView(
      BuildContext context, double itemWidth, double itemHeight) {
    return GridView.builder(
      itemCount: context.watch<MenuProvider>().products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final product = context.watch<MenuProvider>().products[index];
        return GestureDetector(
          onTap: () {
            context.router.push(DetailsViewRoute(product: product));
          },
          child: Material(
            child: ProductContainer(
              product: product,
            ),
          ),
        );
      },
    );
  }

  ChangeNotifierProvider<UserProvider> _categories() {
    return ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: Consumer<UserProvider>(
            builder: (context, selectedIndexProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoriesText(context),
              SizedBox(
                height: context.height * 0.05,
                child: context.watch<MenuProvider>().isLoading
                    ? _circularProgress()
                    : _categoriesListView(context, selectedIndexProvider),
              ),
            ],
          );
        }));
  }

  Text _categoriesText(BuildContext context) {
    return Text(
      LanguageItems.categories,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  ListView _categoriesListView(
      BuildContext context, UserProvider selectedIndexProvider) {
    return context.watch<MenuProvider>().menus.isEmpty
        ? ListView()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<MenuProvider>().menus.length + 1,
            itemBuilder: (context, index) {
              return _buildSelectedActionChip(
                  index, selectedIndexProvider, context);
            },
          );
  }

  Center _circularProgress() {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.yellow,
    ));
  }

  ActionChip _buildSelectedActionChip(
      int index, UserProvider selectedIndexProvider, BuildContext context) {
    return ActionChip(
      backgroundColor: index == selectedIndexProvider.selectedIndex
          ? const Color(0xffFEDE00)
          : Colors.black12,
      label: Text(
        index == 0
            ? LanguageItems.all
            : context.watch<MenuProvider>().menus[index - 1].name ?? "",
        style: TextStyle(
          color: index == selectedIndexProvider.selectedIndex
              ? Colors.black
              : Colors.white,
        ),
      ),
      onPressed: () {
        context.read<UserProvider>().selectedIndex = index;
        if (index == 0) {
          context.read<MenuProvider>().getAllProducts();
        } else {
          context
              .read<MenuProvider>()
              .getProducts(context.read<MenuProvider>().menus[index - 1]);
        }
      },
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(LanguageItems.welcome),
            Text(
              context.watch<UserProvider>().username,
              style: context.textTheme.titleMedium,
            )
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.yellow,
        ),
      ],
    );
  }

  Container _searchContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      child: const TextField(
        decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}

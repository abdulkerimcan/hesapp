import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/features/home/model/product_model.dart';
import 'package:hesapp/features/home/viewmodel/selected_card_provider.dart';
import 'package:hesapp/features/home/widget/product_cart.dart';

import 'package:provider/provider.dart';

@RoutePage()
class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          elevation: 0,
          title: _header(),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          _categories(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final product = Product(
                  id: index.toString(),
                  name: "Pizza $index",
                  price: 10,
                  image: "assets/images/pizza.jpeg");
              return GestureDetector(
                onTap: () {
                  context.router.push(DetailsViewRoute(product: product));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailsView(product: product)));
                },
                child: Hero(
                  tag: "food-image$index",
                  child: Material(
                    child: ProductContainer(
                      product: product,
                    ),
                  ),
                ),
              );
            },
          ))
        ]),
      ),
    ));
  }

  ChangeNotifierProvider<SelectedIndexProvider> _categories() {
    return ChangeNotifierProvider(
        create: (_) => SelectedIndexProvider(),
        child: Consumer<SelectedIndexProvider>(
            builder: (context, selectedIndexProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ActionChip(
                      backgroundColor:
                          index == selectedIndexProvider.selectedIndex
                              ? const Color(0xffFEDE00) // selected color
                              : Colors.black12,
                      label: Text("All",
                          style: TextStyle(
                              color:
                                  index == selectedIndexProvider.selectedIndex
                                      ? Colors.black
                                      : Colors.white)),
                      onPressed: () {
                        selectedIndexProvider.selectedIndex = index;
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }));
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [Text("Welcome"), Text("Abdulkerim")],
        ),
        Container(
          color: Colors.red,
          height: 40,
          width: 40,
        )
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

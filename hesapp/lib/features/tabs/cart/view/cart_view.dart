import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:hesapp/features/tabs/cart/widget/custom_card.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.confirmYourOrder),
      ),
      body: context.watch<UserProvider>().totalProduct == 0
          ? _placeHolder(context)
          : Column(
              children: [
                Padding(
                  padding: context.paddingNormalVertical,
                  child: _buildListView(context),
                ),
                _buildButton(context),
              ],
            ),
    );
  }

  Center _placeHolder(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              color: Colors.yellow,
              size: context.height * 0.2,
              Icons.shopping_basket_outlined),
          Text(
            "Your cart is empty.",
            style: context.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  SizedBox _buildListView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
          itemCount: context.watch<UserProvider>().totalProduct,
          itemBuilder: (context, index) {
            var product = context.watch<UserProvider>().basketItems[index];
            return CustomCard(product: product);
          }),
    );
  }

  ElevatedButton _buildButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        onPressed: () {},
        child: Text(
          LanguageItems.confirmYourOrder,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}

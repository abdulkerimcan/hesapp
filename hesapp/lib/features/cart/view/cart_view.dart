import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/features/cart/widget/card/custom_card.dart';
import 'package:hesapp/product/model/user_model.dart';
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
        title: const Text("Confirm Your Order"),
      ),
      body: Column(
        children: [
          _buildListView(context),
          const SizedBox(
            height: 30,
          ),
          _buildButton(context),
        ],
      ),
    );
  }

  SizedBox _buildListView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
          itemCount: context.watch<User>().totalProduct,
          itemBuilder: (context, index) {
            var product = context.watch<User>().basketItems[index];
            return CustomCard(product: product);
          }),
    );
  }

  ElevatedButton _buildButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        onPressed: () {},
        child: Text(
          "Confirm Your Order",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}

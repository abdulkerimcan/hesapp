import 'package:flutter/material.dart';
import 'package:hesapp/product/model/user_model.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';

class ProductContainer extends StatelessWidget {
  final Product product;
  const ProductContainer({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(
                product.image ?? "",
              ),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: _buildStack(context),
    );
  }

  Stack _buildStack(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 5,
          bottom: 10,
          child: Container(
              width: 40,
              color: Colors.grey,
              child: AnimatedCrossFade(
                  firstChild: Column(children: [
                    IconButton(
                        onPressed: () {
                          context.read<User>().increaseProduct(product);
                        },
                        icon: const Icon(Icons.add)),
                    Text(
                        "${context.watch<User>().basketProducts[product] ?? 0}"),
                    IconButton(
                        onPressed: () {
                          context.read<User>().decreaseProduct(product);
                        },
                        icon: const Icon(Icons.remove)),
                  ]),
                  secondChild: IconButton(
                      onPressed: () {
                        context.read<User>().addFirstItemToBasket(product);
                      },
                      icon: const Icon(Icons.dining)),
                  crossFadeState:
                      context.read<User>().basketProducts[product] != null
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500))),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Text(
            "Sucuklu Pizza",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.yellow, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            left: 10,
            bottom: 0,
            child: Text(
              "10 TL",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.yellow, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

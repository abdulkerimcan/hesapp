import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/constants.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';

import '../model/menu_model.dart';

class ProductContainer extends StatefulWidget {
  final Product product;
  const ProductContainer({
    super.key,
    required this.product,
  });

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _backgroundImage(),
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
              width: context.highWidthValue,
              color: Colors.grey,
              child: AnimatedCrossFade(
                  firstChild: Column(children: [
                    _addCartIconButton(context),
                    _basketProductsLengthText(context),
                    _removeCartIconButton(context),
                  ]),
                  secondChild: _addFirstIconButton(context),
                  crossFadeState: context
                              .read<UserProvider>()
                              .basketProducts[widget.product] !=
                          null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500))),
        ),
        Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _productNameText(context),
              _productPriceText(context),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration _backgroundImage() {
    return const BoxDecoration(
        image: DecorationImage(
            opacity: 0.5,
            image: AssetImage(
              AssetConstants.pizzaImage,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(AppConstants.kValue)));
  }

  Text _productPriceText(BuildContext context) {
    return Text(
      "${widget.product.price} ₺",
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Colors.yellow, fontWeight: FontWeight.bold),
    );
  }

  Text _productNameText(BuildContext context) {
    return Text(
      widget.product.name ?? "",
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: Colors.yellow, fontWeight: FontWeight.bold),
    );
  }

  IconButton _addFirstIconButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<UserProvider>().addFirstItemToBasket(widget.product);
        },
        icon: const Icon(Icons.dining));
  }

  Text _basketProductsLengthText(BuildContext context) {
    return Text(
        "${context.watch<UserProvider>().basketProducts[widget.product] ?? 0}");
  }

  IconButton _removeCartIconButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<UserProvider>().decreaseProduct(widget.product);
        },
        icon: const Icon(Icons.remove));
  }

  IconButton _addCartIconButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<UserProvider>().increaseProduct(widget.product);
        },
        icon: const Icon(Icons.add));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';
import '../../menu/model/menu_model.dart';

class CustomCard extends StatefulWidget {
  final Product product;
  const CustomCard({super.key, required this.product});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.kValue))),
        height: context.height * 0.12,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildImage(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _productNameText(context),
              _productPriceText(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _increaseButton(context),
                  _productLengthText(context),
                  _decreaseButton(context),
                ],
              ),
            ],
          ),
          _deleteIcon()
        ]),
      ),
    );
  }

  IconButton _decreaseButton(BuildContext context) {
    return IconButton(
        color: Colors.yellow,
        onPressed: () {
          if (context.read<UserProvider>().basketProducts[widget.product] ==
              1) {
            _showDialog(context);
          } else {
            context.read<UserProvider>().decreaseProduct(widget.product);
          }
        },
        icon: const Icon(Icons.remove_circle_sharp));
  }

  Text _productLengthText(BuildContext context) {
    return Text(
        "${context.watch<UserProvider>().basketProducts[widget.product] ?? 0}");
  }

  IconButton _increaseButton(BuildContext context) {
    return IconButton(
        color: Colors.yellow,
        onPressed: () {
          context.read<UserProvider>().increaseProduct(widget.product);
        },
        icon: const Icon(Icons.add_circle_sharp));
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return _alertDialog(context);
        });
  }

  AlertDialog _alertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
          'Are you sure you want to remove this product from the cart?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().removeProduct(widget.product);
              context.router.pop();
            },
            child: Text(
              "Yes",
              style:
                  context.textTheme.titleLarge?.copyWith(color: Colors.black),
            )),
        ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: Text(
            "No",
            style: context.textTheme.titleLarge?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }

  IconButton _deleteIcon() {
    return IconButton(
        color: Colors.white60,
        onPressed: () {
          _showDialog(context);
        },
        icon: const Icon(Icons.delete));
  }

  Text _productPriceText(BuildContext context) {
    return Text(
      "${widget.product.price.toString()} ₺",
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Text _productNameText(BuildContext context) {
    return Text(
      widget.product.name ?? LanguageItems.foodName,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Container _buildImage(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AssetConstants.pizzaImage)),
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.kValue))));
  }
}

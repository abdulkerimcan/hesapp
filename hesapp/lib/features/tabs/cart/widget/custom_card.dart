import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
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
            borderRadius: BorderRadius.all(Radius.circular(AppConstants.kValue))),
        height: context.highHeightValue,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildImage(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _productNameText(context),
              _productPriceText(context),
            ],
          ),
          _deleteIcon()
        ]),
      ),
    );
  }

  IconButton _deleteIcon() {
    return IconButton(
            color: Colors.white60,
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined));
  }

  Text _productPriceText(BuildContext context) {
    return Text(
              widget.product.price.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            );
  }

  Text _productNameText(BuildContext context) {
    return Text(
              widget.product.name ?? LanguageItems.foodName,
              style: Theme.of(context).textTheme.titleLarge,
            );
  }

  Container _buildImage(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetConstants.pizzaImage)),
                borderRadius: BorderRadius.all(Radius.circular(AppConstants.kValue))));
  }
}

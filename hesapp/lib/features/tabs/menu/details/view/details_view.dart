import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';
import '../../model/menu_model.dart';

@RoutePage()
class DetailsView extends StatefulWidget {
  final Product product;
  const DetailsView({super.key, required this.product});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildImage(context),
            _buildBackButton(),
            _buildContainer(context),
          ],
        ),
      ),
    );
  }

  Positioned _buildContainer(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: _containerDecoration(),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productNameText(context),
                    _productPriceText(context),
                  ],
                ),
                _productDescription(context),
                Center(
                    child: AnimatedCrossFade(
                  firstChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<UserProvider>()
                                .increaseProduct(widget.product);
                          },
                          icon: const Icon(
                            Icons.add_circle_sharp,
                            color: Colors.yellow,
                          )),
                      Text(
                        "${LanguageItems.productNumberInCart} ${context.watch<UserProvider>().basketProducts[widget.product] ?? 0}",
                        style: context.textTheme.labelSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<UserProvider>()
                              .decreaseProduct(widget.product);
                        },
                        icon: const Icon(Icons.remove_circle_sharp),
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  secondChild: _buildButton(context),
                  crossFadeState: context
                              .read<UserProvider>()
                              .basketProducts[widget.product] !=
                          null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(microseconds: 300),
                ))
              ]),
        ),
      ),
    );
  }

  Text _productDescription(BuildContext context) {
    return Text(
      widget.product.description ?? "null",
      style: context.textTheme.titleMedium,
    );
  }

  Text _productPriceText(BuildContext context) {
    return Text(
      "${widget.product.price} ₺",
      style: context.textTheme.headlineLarge,
    );
  }

  Text _productNameText(BuildContext context) {
    return Text(
      widget.product.name ?? "",
      style: context.textTheme.headlineSmall,
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppConstants.kValue * 2)));
  }

  ElevatedButton _buildButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
        onPressed: () {
          context.read<UserProvider>().addFirstItemToBasket(widget.product);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageItems.addToCart,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Icon(
              Icons.restaurant_menu_outlined,
              color: Colors.black,
            )
          ],
        ));
  }

  Positioned _buildBackButton() {
    return Positioned(
      top: 20,
      left: 20,
      child: Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey[800]),
        child: IconButton(
          color: Colors.amber,
          icon: const Icon(Icons.arrow_left_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Positioned _buildImage(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: SizedBox(
          height: context.height * 0.5,
          child: Image.asset(
            AssetConstants.pizzaImage,
            fit: BoxFit.cover,
          )),
    );
  }
}

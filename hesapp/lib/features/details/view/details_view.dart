import 'package:flutter/material.dart';
import 'package:hesapp/features/home/model/product_model.dart';

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
        decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(50))),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name ?? "Food Name",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "${widget.product.price} ₺",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Text(
                  "description description description description description description description description description description description description description description description description ",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                _buildButton(context)
              ]),
        ),
      ),
    );
  }

  Center _buildButton(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add to Cart",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const Icon(
                  Icons.restaurant_menu_outlined,
                  color: Colors.black,
                )
              ],
            )));
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
          iconSize: 40,
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
          height: MediaQuery.of(context).size.height * 0.5,
          child: Hero(
            
            tag: "food-image${widget.product.id}",
            child: Image.asset(
              "assets/images/pizza.jpeg",
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

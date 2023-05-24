import 'package:flutter/material.dart';
import 'package:hesapp/features/home/model/product_model.dart';

class CustomCard extends StatefulWidget {
  final Product product;
  const CustomCard({super.key, required this.product});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        height: 100,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.product.image ?? "")),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.product.name ??  "Food Name",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                widget.product.price.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          IconButton(
              color: Colors.white60,
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined))
        ]),
      ),
    );
  }
}

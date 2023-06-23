import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/features/tabs/payment/viewmodel/payment_provider.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: context.watch<PaymentProvider>().orders?.length ?? 0,
          //     itemBuilder: (context, index) {
          // return ListTile(
          //   leading: Container(
          //     width: 40,
          //     height: 40,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(100),
          //       color: Colors.yellow.withOpacity(0.1),
          //     ),
          //     child: const Icon(
          //       LineAwesomeIcons.money_bill,
          //       color: Colors.yellow,
          //     ),
          //   ),
          //   title: Text(
          //       "${context.watch<PaymentProvider>().orders?[index].menuItemName}"),
          //   trailing: const Text("saasa"),
          // );
          //     },
          //   ),
          // )

          Expanded(
              child: ListView.builder(
            itemCount: context.watch<PaymentProvider>().orderItems.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: context.paddingLow,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow.withOpacity(0.1)),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow.withOpacity(0.1),
                      ),
                      child: const Icon(
                        LineAwesomeIcons.money_bill,
                        color: Colors.yellow,
                      ),
                    ),
                    title: Text(
                        "${context.watch<PaymentProvider>().orderItems[index].menuItemName}"),
                    trailing: Text(
                        "${context.watch<PaymentProvider>().orderItems[index].quantity}"),
                  ));
            },
          ))
        ],
      ),
    );
  }
}

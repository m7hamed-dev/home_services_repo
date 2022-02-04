import 'package:flutter/material.dart';
import 'package:home_services/providers/payment_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _paymentProvider = context.read<PaymentProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _paymentProvider.paymentMethods.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => _paymentProvider.setIndex(index),
            title: Text(_paymentProvider.paymentMethods[index].name),
            leading: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _paymentProvider.paymentMethods[index].color,
              ),
              child: Image.asset(
                'assets/images/payments/${_paymentProvider.paymentMethods[index].imgUrl}.png',
              ),
            ),
            trailing: Consumer<PaymentProvider>(
              builder: (context, value, child) => Icon(
                _paymentProvider.currentIndex == index ? Icons.done : null,
                size: 33.0,
                color: Colors.green,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

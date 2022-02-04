import 'package:flutter/material.dart';
import 'package:home_services/models/our_services_model.dart';
import 'package:home_services/providers/cart_provider.dart';
import 'package:home_services/utils/constants.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/utils/screen_utils.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/btn.dart';
import 'package:provider/src/provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartProvprider _cartProvprider = context.watch<CartProvprider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AppTxt('Our Items Cart  ', fontSize: 30.0),
            ),
            Expanded(
              flex: 5,
              child: ScreenUtils.isDesktop(context)
                  ? GridView.builder(
                      gridDelegate: Constants.gridDelegateProperties(
                        context,
                        crossAxisCount: 3,
                      ),
                      itemCount: _cartProvprider.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        // define obj model
                        final OurServicesModel _servicesModel =
                            _cartProvprider.cartItems[index];
                        // ui
                        return DesignCartItem(
                          servicesModel: _servicesModel,
                          cartProvprider: _cartProvprider,
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: _cartProvprider.cartItems.length,
                      itemBuilder: (context, index) {
                        // define obj model
                        final OurServicesModel _servicesModel =
                            _cartProvprider.cartItems[index];
                        // ui
                        return DesignCartItem(
                          servicesModel: _servicesModel,
                          cartProvprider: _cartProvprider,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(8.0),
        // margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(.04),
        ),
        child: ListTile(
          title: const AppTxt(
            'total price',
            fontSize: 12.0,
          ),
          subtitle: AppTxt(
            '\$ ${_cartProvprider.totalPrice}',
            fontSize: 12.0,
          ),
          trailing: Btn(
            width: 140.0,
            child: const AppTxt(
              'Your Services',
              fontSize: 18.0,
            ),
            onPressed: () {
              Push.to(context, const CartView());
            },
          ),
        ),
      ),
    );
  }
}

class DesignCartItem extends StatelessWidget {
  const DesignCartItem({
    Key? key,
    required this.servicesModel,
    required this.cartProvprider,
  }) : super(key: key);
  final OurServicesModel servicesModel;
  final CartProvprider cartProvprider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
      ),
      // dismisable
      child: Dismissible(
        key: Key(servicesModel.imgUrl),
        onDismissed: (DismissDirection direction) {
          //
          if (direction == DismissDirection.endToStart) {
            cartProvprider.removeItemFromCart(servicesModel);
          }
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/${servicesModel.imgUrl}.png',
                // height: 90.0,
                // width: 90.0,
                // fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTxt(
                    servicesModel.jobTitle,
                    fontSize: 20.0,
                  ),
                  AppTxt(
                    servicesModel.jobTitle,
                    fontSize: 13.0,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTxt(
                        '\$${servicesModel.price}',
                        fontSize: 28.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red.shade100,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartProvprider.addQtyService(servicesModel);
                              },
                              icon: const Icon(Icons.add),
                            ),
                            AppTxt(
                              '${servicesModel.qty}',
                              fontSize: 20.0,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

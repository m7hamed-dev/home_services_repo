import 'package:flutter/material.dart';
import 'package:home_services/models/our_services_model.dart';
import 'package:home_services/providers/cart_provider.dart';
import 'package:home_services/providers/our_services_provider.dart';
import 'package:home_services/widgets/custom_snackbar.dart';
import 'package:provider/src/provider.dart';

import 'app_txt.dart';

class OurServicesCard extends StatelessWidget {
  const OurServicesCard({
    Key? key,
    required this.ourServicesModel,
    required this.cartProvprider,
  }) : super(key: key);
  //
  final OurServicesModel ourServicesModel;
  final CartProvprider cartProvprider;
  //
  @override
  Widget build(BuildContext context) {
    final _ourServicesProvprider = context.watch<OurServicesProvprider>();
    //
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: ourServicesModel.color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(
                'assets/images/${ourServicesModel.imgUrl}.png',
                // height: 90.0,
                // width: 90.0,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTxt(
                  ourServicesModel.jobTitle,
                  fontSize: 20.0,
                ),
                AppTxt(
                  ourServicesModel.jobTitle,
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTxt(
                      '\$${ourServicesModel.price}',
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
                              cartProvprider.addServiseToCart(ourServicesModel);
                              //
                              _ourServicesProvprider
                                  .removeServiceFromList(ourServicesModel);
                              //
                              CustomSnackBar.show(
                                context,
                                ourServicesModel.jobTitle,
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                          const AppTxt(
                            '1',
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
    );
  }
}

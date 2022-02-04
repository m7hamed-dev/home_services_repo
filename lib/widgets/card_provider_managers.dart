import 'package:flutter/material.dart';
import 'package:home_services/models/service_mangers_model.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/details_provider_managers_view.dart';
import 'package:home_services/widgets/btn.dart';
import 'package:home_services/widgets/cached_img.dart';
import 'package:provider/src/provider.dart';

class CardProviderManagers extends StatelessWidget {
  const CardProviderManagers({
    Key? key,
    required this.serviceManagersModel,
  }) : super(key: key);
  //
  final ServiceManagersModel serviceManagersModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Push.to(
          context, DetailsProviderManagersView(service: serviceManagersModel)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          // border: Border.all(
          //   color: _categoryProvider.currentIndex == index
          //       ? Colors.grey
          //       : Colors.white,
          //   width: _categoryProvider.currentIndex == index ? 3.0 : 0.5,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 2.0,
              blurRadius: 10.0,
              offset: const Offset(2.2, 2.2),
            )
          ],
        ),
        child: Row(
          children: [
            CachedImg(
              width: 60.0,
              height: 70.0,
              imageUrl: serviceManagersModel.imgUrl,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(serviceManagersModel.name),
                  Text(serviceManagersModel.name),
                  Btn(
                    child: const Text('book now'),
                    onPressed: () {},
                    color: Colors.red.shade600,
                    radius: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(serviceManagersModel.status ? 'Open' : 'Closed'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_rate_rounded, color: Colors.amber),
                      Text(serviceManagersModel.rate.toString()),
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

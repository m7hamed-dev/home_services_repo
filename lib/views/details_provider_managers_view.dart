import 'package:flutter/material.dart';
import 'package:home_services/models/service_mangers_model.dart';
import 'package:home_services/views/calender_view.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/btn.dart';
import 'package:home_services/widgets/cached_img.dart';
import 'package:home_services/widgets/rating_count_widget.dart';

class DetailsProviderManagersView extends StatelessWidget {
  const DetailsProviderManagersView({Key? key, required this.service})
      : super(key: key);
  //
  final ServiceManagersModel service;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CachedImg(
                  imageUrl: service.imgUrl,
                  isCircle: true,
                  width: 90.0,
                  height: 90.0,
                ),
                title: AppTxt(service.name, fontSize: 20.0),
                subtitle: Row(
                  children: [
                    RatingCountWidget(countStar: service.rate.floor()),
                    AppTxt('${service.rate}'),
                    // CustomContainer(
                    //   child: Text(service.jobTitle),
                    // ),
                  ],
                ),
              ),
              const AppTxt(
                'Date and Time',
              ),
              const CalenderView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.0,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(service.jobTitle),
                  const SizedBox(width: 10.0),
                  Text(service.jobTitle),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 2,
              child: Btn(
                child: const Text('Book Now'),
                radius: 20.0,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

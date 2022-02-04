import 'package:flutter/material.dart';
import 'package:home_services/animations/my_animation.dart';
import 'package:home_services/models/service_mangers_model.dart';
import 'package:home_services/providers/service%20mangers_provider.dart';
import 'package:home_services/utils/constants.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/details_provider_managers_view.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/cached_img.dart';
import 'package:home_services/widgets/rating_count_widget.dart';
import 'package:provider/src/provider.dart';

class RecomendedProviderManagerView extends StatelessWidget {
  const RecomendedProviderManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _serviceMangersProvider = context.watch<ServiceMangersProvider>();
    // for testing only ....
    _serviceMangersProvider.getCategories();
    //
    if (_serviceMangersProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _serviceMangersProvider.filterServiceManagers.length,
      gridDelegate: Constants.gridDelegateProperties(context),
      itemBuilder: (context, index) {
        // define model
        final ServiceManagersModel _serviceManagersModel = ServiceManagersModel(
          id: 'id',
          name: _serviceMangersProvider.filterServiceManagers[index].name,
          jobTitle:
              _serviceMangersProvider.filterServiceManagers[index].jobTitle,
          imgUrl: _serviceMangersProvider.filterServiceManagers[index].imgUrl,
          rate: _serviceMangersProvider.filterServiceManagers[index].rate,
          status: _serviceMangersProvider.filterServiceManagers[index].status,
        );
        //
        return InkWell(
          onTap: () => Push.to(
            context,
            DetailsProviderManagersView(service: _serviceManagersModel),
          ),
          child: MyAnimation(
            child: Container(
              padding: const EdgeInsets.all(6.0),
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1.0,
                    blurRadius: 3.0,
                    offset: const Offset(2.2, 2.2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedImg(
                    imageUrl: _serviceManagersModel.imgUrl,
                    height: 90.0,
                    width: 90.0,
                    isCircle: true,
                  ),
                  AppTxt(_serviceManagersModel.name),
                  AppTxt(
                    _serviceManagersModel.jobTitle,
                    fontSize: 30.0,
                  ),
                  RatingCountWidget(
                      countStar: _serviceManagersModel.rate.floor()),
                  Text(_serviceManagersModel.rate.toString()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

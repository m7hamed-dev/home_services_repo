import 'package:flutter/material.dart';
import 'package:home_services/models/our_services_model.dart';
import 'package:home_services/providers/cart_provider.dart';
import 'package:home_services/providers/our_services_provider.dart';
import 'package:home_services/shared_data/shared_data.dart';
import 'package:home_services/utils/constants.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/utils/screen_utils.dart';
import 'package:home_services/views/cart_view.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/btn.dart';
import 'package:home_services/widgets/cached_img.dart';
import 'package:home_services/widgets/our_services_card.dart';
import 'package:provider/src/provider.dart';

class OutServicesListView extends StatelessWidget {
  const OutServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('OutServicesListView Rebuild');
    final _ourServicesProvider = context.watch<OurServicesProvprider>();
    final _cartProvprider = context.read<CartProvprider>();
    //
    if (_ourServicesProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: ScreenUtils.getHeight(context) / 3,
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            stretchTriggerOffset: 100.0,
            stretch: true,
            pinned: false,
            floating: false,
            backgroundColor: Colors.white,
            flexibleSpace: const FlexibleSpaceBar(
              // title: Text(providerModel.name, textScaleFactor: 0.7),
              background: CachedImg(
                imageUrl: SharedData.ourServicesImg,
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          // list services

          SliverGrid(
            gridDelegate: Constants.gridDelegateProperties(context),
            delegate: SliverChildBuilderDelegate(
              (BuildContext _, int index) {
                //
                final OurServicesModel _servicesModel =
                    _ourServicesProvider.filterServiceManagers[index];
                //
                return OurServicesCard(
                  ourServicesModel: _servicesModel,
                  cartProvprider: _cartProvprider,
                );
              },
              childCount: _ourServicesProvider.filterServiceManagers.length,
            ),
          ),
        ],
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
          subtitle: const AppTxt(
            '\$ 298',
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

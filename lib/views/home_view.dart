import 'package:flutter/material.dart';
import 'package:home_services/utils/constants.dart';
import 'package:home_services/utils/screen_utils.dart';
import 'package:home_services/views/category_view.dart';
import 'package:home_services/views/recomended_provider_managers_view.dart';
import 'package:home_services/views/sliders_view.dart';
import 'package:home_services/widgets/cached_img.dart';
import 'package:home_services/widgets/home_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('rebuild home view');
    debugPrint('width = [ ${ScreenUtils.getWidth(context)} ]');
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Constants.drawer(context),
      body: Row(
        children: [
          //
          ScreenUtils.getWidth(context) >= 1197
              ? const Expanded(flex: 1, child: HomeDrawer())
              : const SizedBox(width: 0.0, height: 0.0),
          //
          const SizedBox(width: 10.0),
          Expanded(
            flex: 7,
            child: ListView(
              children: [
                const AppTitle(),
                const SlidersView(),
                const SizedBox(height: 20.0),
                const Text('CategoryView'),
                const SizedBox(height: 20.0),
                const CategoryView(),
                const SizedBox(height: 20.0),
                const Text('Recomende For You'),
                const SizedBox(height: 20.0),
                const RecomendedProviderManagerView(),
                const SizedBox(height: 20.0),
                Constants.footer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(5.0),
          child: const CachedImg(
            isCircle: true,
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLe5PABjXc17cjIMOibECLM7ppDwMmiDg6Dw&usqp=CAU',
          ),
        ),
        Column(
          children: const [
            Text('Do you need '),
            Text('Do you need '),
          ],
        ),
        const Icon(Icons.notifications),
      ],
    );
  }
}

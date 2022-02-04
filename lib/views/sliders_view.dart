import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:home_services/utils/screen_utils.dart';
import 'package:home_services/widgets/cached_img.dart';

final _imges = <String>[
  'https://www.getsethome.com/assets/img/page-top/offers.png',
  'https://www.getsethome.com/assets/img/page-top/offers.png',
  'https://www.getsethome.com/assets/img/page-top/offers.png',
  'https://www.getsethome.com/assets/img/page-top/offers.png',
];

class SlidersView extends StatelessWidget {
  const SlidersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getHeight(context) / 4,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2.0,
            blurRadius: 10.0,
            offset: const Offset(2.2, 2.2),
          )
        ],
      ),
      child: Swiper(
        autoplay: true,
        itemCount: _imges.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CachedImg(
            height: 200,
            imageUrl: _imges[index],
          );
        },
        // indicatorLayout: PageIndicatorLayout.COLOR,
        // pagination: const SwiperPagination(
        //   alignment: Alignment.centerLeft,
        // ),
        // control: const SwiperControl(),
      ),
    );
  }
}

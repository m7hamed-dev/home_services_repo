import 'package:flutter/material.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _goToHomeView();
  }

  void _goToHomeView() async {
    await Future.delayed(const Duration(seconds: 2));
    Push.to(context, const HomeView());
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10.0,
            left: 10,
            child: _item('buy'),
          ),
          Positioned(
            bottom: 10.0,
            left: 10,
            child: _item('buy'),
          ),
        ],
      ),
    );
  }

  Container _item(String url) {
    return Container(
      width: 90.0,
      height: 90.0,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.green.withOpacity(.3),
        image: DecorationImage(
          image: AssetImage('assets/images/$url.png'),
        ),
      ),
    );
  }
}

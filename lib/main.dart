import 'package:flutter/material.dart';
import 'package:home_services/views/calender_view.dart';
import 'package:home_services/views/payment_view.dart';
import 'package:home_services/views/splash_view.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/category_provider.dart';
import 'providers/our_services_provider.dart';
import 'providers/payment_provider.dart';
import 'providers/service mangers_provider.dart';
import 'views/home_view.dart';
import 'views/select_role_view.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoryProvider>(
              create: (_) => CategoryProvider()),
          //
          ChangeNotifierProvider<ServiceMangersProvider>(
              create: (_) => ServiceMangersProvider()),
          //
          ChangeNotifierProvider<PaymentProvider>(
              create: (_) => PaymentProvider()),
          //
          ChangeNotifierProvider<OurServicesProvprider>(
              create: (_) => OurServicesProvprider()),
          //
          ChangeNotifierProvider<CartProvprider>(
              create: (_) => CartProvprider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

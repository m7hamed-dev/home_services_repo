import 'package:flutter/material.dart';
import 'package:home_services/shared_data/shared_data.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/home_view.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/btn.dart';

class SignInOrSignUpView extends StatelessWidget {
  const SignInOrSignUpView({Key? key, required this.role}) : super(key: key);
  final String role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade400,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(role == 'customer'
                ? 'assets/imgaes/${SharedData.customer}'
                : 'builder.png'),
            const AppTxt('Select Role', fontSize: 40.0),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Btn(
                    child: const AppTxt('SignIn', fontSize: 20.0),
                    onPressed: () {
                      Push.to(context, const HomeView());
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Btn(
                    child: const AppTxt('SignUp', fontSize: 20.0),
                    onPressed: () {
                      Push.to(context, const HomeView());
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

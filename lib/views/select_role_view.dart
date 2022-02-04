import 'package:flutter/material.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/signin_or_signup_view.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/btn.dart';

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade400,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppTxt('Select Role', fontSize: 40.0),
            const SizedBox(height: 20.0),
            Btn(
              child: const AppTxt('Customer', fontSize: 40.0),
              onPressed: () {
                Push.to(context, const SignInOrSignUpView(role: 'customer'));
              },
            ),
            const SizedBox(height: 20.0),
            Btn(
              child: const AppTxt('Provider', fontSize: 40.0),
              onPressed: () {
                Push.to(context, const SignInOrSignUpView(role: 'provider'));
              },
            )
          ],
        ),
      ),
    );
  }
}

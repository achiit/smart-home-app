import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/auth_screens/login_screen/login_screen.dart';
import 'package:domus/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            text: "ElecWa",
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          NeoPopTiltedButton(
            isFloating: true,
            onTapUp: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            decoration: const NeoPopTiltedButtonDecoration(
              color: Color(0xff464646),
              plunkColor: Color(0xff464646),
              shadowColor: Color.fromRGBO(36, 36, 36, 1),
              showShimmer: true,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 70.0,
                vertical: 15,
              ),
              child: CustomText(
                text: "Get Started",
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                child: Image.asset('assets/images/logo.png'),
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

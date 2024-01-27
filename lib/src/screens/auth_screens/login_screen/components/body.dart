import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/auth_screens/registration_screens/user_registration/user_registration.dart';
import 'package:domus/src/screens/auth_screens/signin_screen/sign_in.dart';
import 'package:domus/src/screens/home_screen/home_screen.dart';
import 'package:domus/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    "assets/images/login.png",
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: Row(
                    children: [
                      CustomText(
                        text: "Let's get in!",
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  NeoPopButton(
                    color: Color(0xffE3F4E1),
                    buttonPosition: Position.center,
                    onTapUp: () {
                      Navigator.pushNamed(
                          context, RegistrationScreen.routeName);
                    },
                    border: Border.fromBorderSide(
                      BorderSide(color: Color(0xffFFA384), width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomText(
                            text: "Create an Account",
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "or",
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  NeoPopButton(
                    color: Color(0xffECE7FE),
                    buttonPosition: Position.center,
                    onTapUp: () {
                      // Navigator.pushNamed(context, SignInScreen.routeName);
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    border: Border.fromBorderSide(
                      BorderSide(color: Color(0xffFFA384), width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomText(
                            text: "Sign In",
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 400, // Adjust the height as needed
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 63, 63, 63),
                Colors.transparent,
                //Colors.red,
              ],
            )), // Adjust the opacity as needed
          ),
        ),
        Positioned(
          top: 30,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

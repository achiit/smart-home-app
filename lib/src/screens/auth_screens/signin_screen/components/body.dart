import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/auth_screens/signin_screen/enter_pass.dart';
import 'package:domus/src/screens/home_screen/home_screen.dart';
import 'package:domus/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        isEmailValid = _isValidEmail(emailController.text);
      });
    });
  }

  bool _isValidEmail(String email) {
    // Add your email validation logic here
    // For a simple example, check if the email contains "@" and "."
    return email.contains("@") && email.contains(".");
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          CustomText(
            text: "Enter your ",
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: "email",
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "xxxxx@domain.com",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: isEmailValid ? Colors.blue : Color(0xffD9D9D9),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          NeoPopButton(
            color: isEmailValid ? Colors.blue : Colors.grey,
            onTapUp: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterPass(),
                ),
              );
            },
            onTapDown: () => HapticFeedback.vibrate(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    color: isEmailValid ? Colors.white : Colors.black,
                    text: "Submit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
          CustomText(
            color: Colors.black,
            text: "Don't have an account?",
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: NeoPopButton(
              color: Color(0xff1573FE),
              onTapUp: () => HapticFeedback.vibrate(),
              onTapDown: () => HapticFeedback.vibrate(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      color: Colors.white,
                      text: "Create Account",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

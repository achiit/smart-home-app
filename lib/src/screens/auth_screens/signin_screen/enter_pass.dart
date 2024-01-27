import 'package:domus/config/size_config.dart';
import 'package:domus/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class EnterPass extends StatefulWidget {
  const EnterPass({Key? key}) : super(key: key);

  @override
  State<EnterPass> createState() => _EnterPassState();
}

class _EnterPassState extends State<EnterPass> {
  TextEditingController passController = TextEditingController();
  bool isPassValid = false;

  @override
  void initState() {
    super.initState();

    passController.addListener(() {
      setState(() {
        isPassValid = _isValidPass(passController.text);
      });
    });
  }

  bool _isValidPass(String pass) {
    // Add your pass validation logic here
    // For a simple example, check if the pass contains "@" and "."
    return pass.length > 5;
  }

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(
                "assets/images/person.png",
              ),
            ),
            Column(
              children: [
                CustomText(
                  color: Colors.black,
                  text: "Name",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  color: Colors.black,
                  text: "xxxxx@domain.com",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            TextField(
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                hintText: "xxxxxxxxxx",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: isPassValid ? Colors.blue : Color(0xffD9D9D9),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            NeoPopButton(
              color: isPassValid ? Colors.blue : Colors.grey,
              onTapUp: () => null,
              onTapDown: () => HapticFeedback.vibrate(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      color: isPassValid ? Colors.white : Colors.black,
                      text: "SignIn",
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
          ],
        ),
      ),
    );
  }
}

import 'package:domus/src/screens/auth_screens/registration_screens/user_registration/components/body.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/register-screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      body: Body(),
    );
  }
}

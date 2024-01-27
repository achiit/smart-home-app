import 'package:domus/src/screens/auth_screens/registration_screens/home_registration/components/body.dart';
import 'package:flutter/material.dart';

class HomeRegistration extends StatelessWidget {
  static String routeName = '/homeregister-screen';
  const HomeRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
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
      body: Body(),
    );
  }
}

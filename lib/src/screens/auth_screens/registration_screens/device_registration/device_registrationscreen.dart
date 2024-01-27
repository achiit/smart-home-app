import 'package:domus/src/screens/auth_screens/registration_screens/device_registration/components/body.dart';
import 'package:flutter/material.dart';

class DeviceRegistration extends StatelessWidget {
  static String routeName = '/deviceregister-screen';
  const DeviceRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
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

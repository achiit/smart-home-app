import 'dart:ui';

import 'package:domus/src/widgets/custom_text.dart';
import 'package:domus/src/widgets/custom_textform.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedDeviceCount = 1;
  List<DeviceDetails> deviceDetailsList = [];
  TextEditingController dropdownHintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Lottie.asset(
            'assets/Lottie/bulb.json',
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomText(
                text: "Now let's add your devices and appliances",
                fontSize: 22,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              DropdownButtonHideUnderline(
                child: DropdownButton2<int?>(
                  isExpanded: true,
                  hint: CustomText(
                    text: dropdownHintController.text.isNotEmpty
                        ? dropdownHintController.text
                        : "Select number of devices",
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  items: [1, 2, 3, 4].map((int value) {
                    return DropdownMenuItem<int?>(
                      value: value,
                      child: CustomText(
                        text: "$value Devices",
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedDeviceCount = newValue ?? 1;
                      deviceDetailsList.clear();
                      for (int i = 0; i < selectedDeviceCount!; i++) {
                        deviceDetailsList.add(DeviceDetails());
                      }
                      // Update the hint text based on the selected value
                      dropdownHintController.text =
                          "$selectedDeviceCount Devices";
                    });
                  },
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0xffc7c7c7),
                    ),
                    offset: const Offset(60, 00),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 160,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Color(0xffc7c7c7),
                    ),
                    elevation: 2,
                  ),
                  selectedItemBuilder: (BuildContext context) {
                    return [1, 2, 3, 4].map<Widget>((int value) {
                      return Text('$selectedDeviceCount Devices');
                    }).toList();
                  },
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: deviceDetailsList.length,
                  itemBuilder: (context, index) {
                    return DeviceRegistrationCard(
                        deviceDetailsList[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: NeoPopTiltedButton(
            isFloating: false,
            onTapUp: () {
              //Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            decoration: const NeoPopTiltedButtonDecoration(
              color: Colors.blue,
              plunkColor: Color(0xff464646),
              shadowColor: Color.fromRGBO(36, 36, 36, 1),
              showShimmer: true,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 70.0,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Let's Go",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DeviceRegistrationCard extends StatefulWidget {
  final DeviceDetails deviceDetails;
  final int index;

  DeviceRegistrationCard(this.deviceDetails, this.index);

  @override
  State<DeviceRegistrationCard> createState() => _DeviceRegistrationCardState();
}

class _DeviceRegistrationCardState extends State<DeviceRegistrationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: Colors.black26,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Device ${widget.index + 1} Details',
            ),
            SizedBox(height: 12),
            CustomTextField(
              labelText: 'Device Name',
              onChanged: () {},
            ),
            SizedBox(height: 12),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String?>(
                isExpanded: true,
                hint: CustomText(
                  text: widget.deviceDetails.deviceType != null
                      ? widget.deviceDetails.deviceType!
                      : "Select device type",
                  fontSize: 17,
                  color: Colors.black,
                ),
                items: ['Bulb', 'Fan', 'Other'].map((String type) {
                  return DropdownMenuItem<String?>(
                    value: type,
                    child: CustomText(
                      text: type,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.deviceDetails.deviceType = newValue ?? 'Bulb';
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xffc7c7c7),
                  ),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return ['Bulb', 'Fan'].map<Widget>((String type) {
                    return Text(widget.deviceDetails.deviceType!);
                  }).toList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceDetails {
  int index;
  String name;
  String? deviceType;

  DeviceDetails({this.index = 0, this.name = '', this.deviceType = 'Bulb'});
}

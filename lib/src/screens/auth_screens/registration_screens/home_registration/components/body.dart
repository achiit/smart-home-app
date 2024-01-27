import 'dart:math';

import 'package:domus/src/widgets/semicircle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:domus/src/widgets/custom_textform.dart';
import 'package:domus/src/widgets/custom_text.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController collegeController = TextEditingController();

  bool isButtonEnabled() {
    final collegename = collegeController.text.trim();

    return collegename.isNotEmpty;
  }

  String selectedImage = "assets/Lottie/male.json"; // Default Lottie animation

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.width / 1.9,
            child: Transform.rotate(
                angle: pi,
                child: MyArc(diameter: MediaQuery.of(context).size.width)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        text: "Name of College",
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: "Don’t worry, you can always change it later",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    child: Lottie.asset(
                      "assets/Lottie/house.json",
                      height: 300,
                    ),
                  ),
                ),
                Form(
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(20),
                        children: [
                          CustomTextField(
                            controller: collegeController,
                            labelText: 'Name of your College',
                            onChanged: () => setState(() {}),
                          ),
                          SizedBox(height: 16),
                          SizedBox(height: 16),
                          NeoPopButton(
                            color:
                                isButtonEnabled() ? Colors.blue : Colors.grey,
                            bottomShadowColor: Colors.grey,
                            rightShadowColor: Colors.grey,
                            animationDuration: Duration(milliseconds: 100),
                            depth: 5,
                            onTapUp: () {
                              Navigator.pushNamed(
                                  context, '/deviceregister-screen');
                            },
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CustomText(
                                    text: "Next",
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:domus/src/models/user_model.dart';
import 'package:domus/viewmodels/auth_viewmodel.dart';
import 'package:domus/viewmodels/user_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:domus/src/widgets/custom_textform.dart';
import 'package:domus/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState(UserViewModel());
}

class _BodyState extends State<Body> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  UserViewModel userViewModel;

  _BodyState(this.userViewModel);
  bool isButtonEnabled() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final email = emailController.text.trim();

    return username.isNotEmpty &&
        password.isNotEmpty &&
        email.isNotEmpty &&
        email.contains('@') &&
        password.length > 6;
  }

  String selectedImage = "assets/Lottie/male.json"; // Default Lottie animation
  var auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            height: constraints.maxHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomText(
                        text: "Fill in your personal details",
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
                Stack(
                  children: [
                    Center(
                      child: Container(
                        child: Lottie.asset(
                          selectedImage,
                          height:
                              constraints.maxHeight * 0.3, // Adjusted height
                        ),
                      ),
                    ),
                    Positioned(
                      right: constraints.maxWidth * 0.27, // Adjusted position
                      bottom: constraints.maxHeight * 0.08, // Adjusted position
                      child: InkWell(
                        onTap: () => _showImagePickerDialog(context),
                        child: Ink(
                          child: CircleAvatar(
                            radius:
                                constraints.maxWidth * 0.055, // Adjusted size
                            backgroundColor: Colors.blue,
                            child: IconButton(
                              onPressed: () => _showImagePickerDialog(context),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 25, // Adjusted size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(20),
                        children: [
                          CustomTextField(
                            controller: usernameController,
                            labelText: 'Username',
                            onChanged: () => setState(() {}),
                          ),
                          SizedBox(
                              height: constraints.maxHeight *
                                  0.02), // Adjusted spacing
                          CustomTextField(
                            controller: emailController,
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: () => setState(() {}),
                          ),
                          SizedBox(
                              height: constraints.maxHeight *
                                  0.02), // Adjusted spacing
                          CustomTextField(
                            controller: passwordController,
                            labelText: 'Password',
                            obscureText: true,
                            onChanged: () => setState(() {}),
                          ),
                          SizedBox(
                              height: constraints.maxHeight *
                                  0.02), // Adjusted spacing
                          NeoPopButton(
                            color:
                                isButtonEnabled() ? Colors.blue : Colors.grey,
                            bottomShadowColor: Colors.grey,
                            rightShadowColor: Colors.grey,
                            animationDuration: Duration(milliseconds: 100),
                            depth: 5,
                            onTapUp: () async {
                              // await FirebaseAuth.instance
                              //     .createUserWithEmailAndPassword(
                              //         email: emailController.text,
                              //         password: passwordController.text);
                              // Get the UserViewModel from the Provider
                              // await auth
                              //     .handleCreateAccount(emailController.text,
                              //         passwordController.text)
                              //     .then((User user) => setState(() {
                              //           //loading = false;
                              //           print("done");
                              //         }));
                              UserViewModel userViewModel =
                                  Provider.of<UserViewModel>(context,
                                      listen: false);

                              // Create a UserModel
                              UserModel user = UserModel(
                                userID:
                                    generateUserId(), // You can use Firebase authentication for a real user ID
                                username: usernameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                gender:
                                    selectedImage == "assets/Lottie/male.json"
                                        ? true
                                        : false,
                              );

                              // Add user to Firestore
                              await userViewModel.addUser(user);

                              // Navigate to the next screen
                            },
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.1,
                                  vertical: constraints.maxHeight * 0.015),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String generateUserId() {
    // Use some logic to generate a user-friendly ID
    // For example, you can use a combination of timestamp and a random number
    return DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000).toString();
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: "Select Avatar",
            fontSize: 20,
            color: Colors.black,
          ),
          content: Container(
            height:
                MediaQuery.of(context).size.height * 0.145, // Adjusted height
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedImage = "assets/Lottie/male.json";
                    });
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height *
                                0.05, // Adjusted size
                            child: Lottie.asset("assets/Lottie/male.json")),
                        CustomText(
                          text: "Male ",
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20, // Adjusted spacing
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedImage = "assets/Lottie/female.json";
                    });
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height *
                                0.05, // Adjusted size
                            child: Lottie.asset("assets/Lottie/female.json")),
                        CustomText(
                          text: "Female ",
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
        );
      },
    );
  }
}

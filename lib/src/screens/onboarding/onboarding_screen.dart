// lib/views/onboarding_screen.dart

import 'package:domus/config/size_config.dart';
import 'package:domus/src/models/intro_screen_model.dart';
import 'package:domus/src/screens/auth_screens/login_screen/login_screen.dart';
import 'package:domus/src/screens/onboarding/components/onboardingpage.dart';
import 'package:domus/src/screens/splash_screen/splash_screen.dart';
import 'package:domus/viewmodels/intro_view_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  final List<OnboardingModel> onboardingData;

  OnboardingScreen({required this.onboardingData});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    // mySLides = getSlides();
    // controller = PageController();

    // FirebaseAuth.instance.authStateChanges().listen((user) {
    //   if (user != null) {
    //     Get.offAll(() => MainPage());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE7F2F8),
        body: Stack(
          children: [
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
                    Color.fromARGB(255, 100, 119, 246),
                    Color(0xFFE7F2F8),
                    //Colors.red,
                  ],
                )), // Adjust the opacity as needed
              ),
            ),
            PageView.builder(
              controller: viewModel.pageController,
              itemCount: widget.onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                    data: widget.onboardingData[index], pageIndex: index);
              },
              onPageChanged: (index) {
                viewModel.currentIndex = index;
              },
            ),
            Positioned(
              top: 20.0, // Adjust the top position
              right: 20.0, // Adjust the right position
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0B2133),
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  if (viewModel.currentIndex <
                      widget.onboardingData.length - 1) {
                    // If not on the last page, jump to the last page
                    viewModel.pageController
                        .jumpToPage(widget.onboardingData.length - 1);
                  } else {
                    // Handle Reset button action here
                    // You can implement a reset action as needed
                    // For example, reset the state and navigate to the first screen
                    viewModel.reset();
                  }
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE7F2F8),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        elevation: 0,
                        backgroundColor: Color(0xff74BDCB),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the previous page with animation
                        if (viewModel.currentIndex > 0) {
                          viewModel.pageController.animateToPage(
                            viewModel.currentIndex - 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: viewModel.pageController,
                      count: widget.onboardingData.length,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Color(0xff0448D8),
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 12,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        elevation: 0,
                        backgroundColor: Color(0xffFFA384),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        if (viewModel.currentIndex <
                            widget.onboardingData.length - 1) {
                          viewModel.pageController.animateToPage(
                            viewModel.currentIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Use a custom route with a swipe animation
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return WillPopScope(
                                  onWillPop: () async {
                                    // Prevent the user from going back
                                    return false;
                                  },
                                  child: SplashScreen(),
                                );
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

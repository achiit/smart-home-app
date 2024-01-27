import 'package:domus/src/models/intro_screen_model.dart';
import 'package:domus/viewmodels/intro_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

class OnboardingPage extends HookWidget {
  final OnboardingModel data;
  final int pageIndex;

  OnboardingPage({required this.data, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);
    final controller = useAnimationController(
      duration: Duration(milliseconds: 500),
    );

    // Define slide animations for text
    final slideTextAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(controller);

    final slideImageAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(controller);

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    // Trigger the animations when the page index changes
    useEffect(() {
      controller.forward(from: 0.0); // Start the animations
      return null; // Cleanup
    }, [pageIndex]);

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.center,
            child: SlideTransition(
              position: slideImageAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: data.islottie
                    ? LottieBuilder.asset(data.imagePath)
                    : Image.asset(
                        data.imagePath,
                        height: double.infinity,
                        width: double.infinity,
                      ),
              ),
            ),
          ),
        ),
        //SizedBox(height: 20.0),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SlideTransition(
              position: slideTextAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data.description,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff778595),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

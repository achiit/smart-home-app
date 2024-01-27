import 'package:domus/provider/getit.dart';
import 'package:domus/routes/routes.dart';
import 'package:domus/service/navigation_service.dart';
import 'package:domus/src/models/intro_screen_model.dart';
import 'package:domus/src/screens/onboarding/onboarding_screen.dart';
// import 'package:domus/src/screens/about_screen/about_us_screen.dart';
import 'package:domus/src/screens/splash_screen/splash_screen.dart';
import 'package:domus/viewmodels/intro_view_model.dart';
import 'package:domus/viewmodels/user_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
      title: 'Smart Living, Your Way',
      description:
          "Personalized control, automated routines—your home, your rules.",
      imagePath: 'assets/images/1.png', // Replace with your image paths
      islottie: false),
  OnboardingModel(
      title: 'Unleashed Efficiency',
      description:
          'Track, optimize, and save energy effortlessly for a greener lifestyle.',
      imagePath: 'assets/images/intro 2.png', // Replace with your image paths
      islottie: false),
  OnboardingModel(
      title: 'Simplified Security',
      description:
          'Tailor security, control access—enjoy peace of mind at your fingertips.',
      imagePath: 'assets/Lottie/lottie.json', // Replace with your image paths
      islottie: true),

  // Add more OnboardingModel instances for additional screens
];

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<OnboardingViewModel>(
      create: (context) => OnboardingViewModel(),
    ),
    ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
    ),
    
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domus',
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        fontFamily: 'Nato Sans',
        textSelectionTheme: const TextSelectionThemeData(
          // Set Up for TextFields
          cursorColor: Colors.grey,
          selectionColor: Colors.blueGrey,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF2F2F2),
          //secondary: Color(0xFFF4AE47),
          surface: Color(0xFFC4C4C4),
          background: Color(0xFFFFFFFF),
          error: Color(0xFFB00020),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFF464646),
          ),
          headline2: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF464646),
          ),
          headline3: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFF464646),
          ),
          headline4: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFFBDBDBD),
          ),
          headline5: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFFBDBDBD),
          ),
          headline6: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF464646),
          ),
        ),
      ),
      routes: routes,
      home: OnboardingScreen(onboardingData: onboardingData),
    );
  }
}

///---------------Build Release Apk----------------///
///flutter build apk --build-name=1.0.x --build-number=x

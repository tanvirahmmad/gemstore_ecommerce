import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/onboarding_state/on_boarding_state.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';

class MyRoutes {
  MyRoutes._();

  static void navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  static void navigateOnBoardingPage(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const OnBoarding()));
  }

}
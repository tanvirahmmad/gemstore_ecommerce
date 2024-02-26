import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/features/screens/dress_catagory.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/intro_screen_view.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/navigation_bar/navigation_bar.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';

import '../widgets/details_screen.dart';

class MyRoutes {
  MyRoutes._();

  static void navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  static void navigateOnBoardingPage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroScreenView()));
  }

  static void NavigateToNavigationBar(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NavigationBarSet()));
  }

  static void navigateToProductDetailsScreen(BuildContext context, Product product) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsScreen(product)));
  }
  static void navigateToDressDetailsScreen(BuildContext context,Product product) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DressCAtagory(product: product,)));
  }
}
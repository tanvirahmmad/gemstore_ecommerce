import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/features/screens/dress_catagory.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/intro_screen_view.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/my_cart.dart';
import 'package:gemstore_ecommerce/features/screens/navigation_bar/navigation_bar.dart';
import 'package:gemstore_ecommerce/features/screens/show_all/show_all_products.dart';
import 'package:gemstore_ecommerce/models/catagory_products_id.dart';
import 'package:gemstore_ecommerce/models/enum.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/repository/recommended_repository.dart';

import '../widgets/details_screen.dart';

class MyRoutes {
  MyRoutes._();

  static void navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationBarSet()));
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

  static void featureproductsnavigateToShowAllProductsScreen(
    BuildContext context,
    ProductTypes productTypes, {
    ProductTags? productTags,
  }) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ShowAllProducts(productTypes: productTypes, productTags: productTags,)));
  }

  static void navigateToDetailsScreen(BuildContext context, Product product) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsScreen(product)));
  }
  static void navigateToDressCatagory(BuildContext context,CatagoryName catagoryName) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ShowAllProducts(productTypes:ProductTypes.catagory, catagoryName: CatagoryName.dress ,)));
  }
  static void navigateToCatagorytwo(BuildContext context,CatagoryName catagoryName) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ShowAllProducts(productTypes:ProductTypes.catagory, catagoryName: CatagoryName.beauty ,)));
  }

  }
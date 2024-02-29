import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';

class TopCollectionSliderTwo extends StatelessWidget {
  const TopCollectionSliderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7,right: 10,left: 10),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          MyRoutes.featureproductsnavigateToShowAllProductsScreen(context, ProductTypes.feature);

          // Handle the onTap event if needed
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
          child: Image.asset(

            MyAssetsStrings.mostsexy,
            fit: BoxFit.contain, // Use BoxFit.cover to maintain aspect ratio and cover the entire box
          ),
        ),
      ),
    );

  }

}


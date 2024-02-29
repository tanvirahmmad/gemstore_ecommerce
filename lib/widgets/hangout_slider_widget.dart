import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/models/enum.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';

class HangOutSlider extends StatelessWidget {
  const HangOutSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: MediaQuery.of(context).size.width*.99,
      child: InkWell(
        onTap: () {
          MyRoutes.featureproductsnavigateToShowAllProductsScreen(
            context,
            ProductTypes.tags,
            productTags: ProductTags.saree,
          );
        },

        child: Image.asset(
          MyAssetsStrings.hangout,
fit: BoxFit.contain,
        ),
      ),
    );
  }
}

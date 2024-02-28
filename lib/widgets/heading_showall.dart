import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/show_all_products.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/repository/recommended_repository.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';

import '../models/product_response.dart';
import '../models/product_response.dart';

class HeadingAndShowAll extends StatelessWidget {
  final String? headingtext;


   HeadingAndShowAll({Key? key, required this.headingtext, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headingtext!,
            style: TextStyle(
                color: Color(int.parse(MyColor.myColorTwo)),
                fontFamily: MyAssetsStrings.productSans,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),

        TextButton(
          onPressed: () {

            if(headingtext==MyStrings.feature_products) {
MyRoutes.featureproductsnavigateToShowAllProductsScreen(context, ProductTypes.feature);
            }else if(headingtext==MyStrings.recommended){


          //   MyRoutes.navigateToRecommendedShowAllProductsScreen(context, ProductResponse:recommendedProductResponse, product);
            }
          },
          child: Text(
            MyStrings.show_all,
            style: TextStyle(
                color: Colors.black54,
                fontFamily: MyAssetsStrings.productSans,
                fontSize: 13,
                fontWeight: FontWeight.w800),
          ),
        ),
      ],
    ));
  }
}

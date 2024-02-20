import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MyAssetsStrings.sports_wear),
            ),
          ),
        ),
        Positioned(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Color(int.parse(MyColor.myColorOne)),
                  borderRadius: BorderRadius.circular(70.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.4), // Set the shadow color
                      spreadRadius: 2, // Set the spread radius of the shadow
                      blurRadius: 5, // Set the blur radius of the shadow
                      offset: Offset(0, 1), // Set the offset of the shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              ),
            ),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(70.0)),
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ],
        ))
      ],
    );
  }
}

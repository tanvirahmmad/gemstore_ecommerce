import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class AutumnCollection extends StatelessWidget {
  const AutumnCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            MyAssetsStrings.autumn_collection,
            height: 268,
            width: 512,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class AutumnCollection extends StatelessWidget {
  const AutumnCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        MyAssetsStrings.autumn_collection,
        height:168,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

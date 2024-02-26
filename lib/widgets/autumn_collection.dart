import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class AutumnCollection extends StatelessWidget {
  const AutumnCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        highlightColor: Colors.transparent, // Set highlightColor to transparent
        onTap: () {
          // Handle the onTap action
        },
        child: Image.asset(
          MyAssetsStrings.autumn_collection,
          fit: BoxFit.contain,
        ),
      ),
    );

  }
}

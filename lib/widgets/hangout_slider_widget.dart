import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class HangOutSlider extends StatelessWidget {
  const HangOutSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: MediaQuery.of(context).size.width*.99,
      child: InkWell(
        child: Image.asset(
          MyAssetsStrings.hangout,
fit: BoxFit.contain,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';

class HeadingAndShowAll extends StatelessWidget {
  final String? headingtext;

  const HeadingAndShowAll({super.key, required this.headingtext});

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
            onPressed: () {},
            child: Text(
              MyStrings.show_all,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: MyAssetsStrings.productSans,
                  fontSize: 13,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}

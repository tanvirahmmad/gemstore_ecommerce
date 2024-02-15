import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class FeatureProductsSlider extends StatelessWidget {
  const FeatureProductsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 16);
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  MyAssetsStrings.maskgroup,
                  height: 172,
                  width: 126,
                ),
                Text(
                  "Turtleneck Sweater",
                  style: TextStyle(
                    fontFamily: MyAssetsStrings.productSansMedium,
                    fontSize: 12,
                    color: Color(int.parse(MyColor.myColorSix)),
                  ),
                ),
                Text(
                  "\$ 39.20",
                  style: TextStyle(
                    fontFamily: MyAssetsStrings.productSansMedium,
                    fontSize: 16,
                    color: Color(int.parse(MyColor.myColorSix)),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

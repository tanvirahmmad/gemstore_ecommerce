import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class RecomendedSliderImage extends StatelessWidget {
  const RecomendedSliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 65,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Example itemCount
          separatorBuilder: (BuildContext context, int index) {
            // Add space between items
            return SizedBox(
                width: 18); // Adjust the width according to your preference
          },
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Image.asset(
                  MyAssetsStrings.recomended_image,
                  height: 66,
                  width: 66,
                ),
                SizedBox(width: 10), // Add space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "White fashion hoodie",
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productSansMedium,
                        fontSize: 16,
                        color: Color(int.parse(MyColor.myColorSix)),
                      ),
                    ),
                    SizedBox(height: 8), // Add space between name and price
                    Text(
                      "\$ 29.00",
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productSansMedium,
                        fontSize: 16,
                        color: Color(int.parse(MyColor.myColorSix)),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

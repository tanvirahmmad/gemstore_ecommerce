import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class TopCollectionSlider extends StatelessWidget {
  const TopCollectionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 194,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Example itemCount
          separatorBuilder: (BuildContext context, int index) {
            // Add space between items
            return SizedBox(
                width: 15); // Adjust the width according to your preference
          },
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            child:Image.asset(
                  MyAssetsStrings.office_tshirt,
                ),
            ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "T-Shirts",
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productSansMedium,
                        fontSize: 13,
                        color: Color(int.parse(MyColor.myColorSeven)),
                      ),
                    ),
                    SizedBox(height: 12), // Add space between name and price
                    Text(
                      "The\nOffice\nLife",
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productsanslight,
                        fontSize: 17,
                        color: Color(int.parse(MyColor.myColorEight)),
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

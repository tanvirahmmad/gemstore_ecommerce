import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class TopCollectionSlider extends StatelessWidget {
  const TopCollectionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: 160,
              width: 130,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  // Handle the onTap event if needed
                },
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the radius as needed
                  child: Image.asset(
                    MyAssetsStrings.office_tshirt,
                    fit: BoxFit
                        .contain, // Use BoxFit.cover to maintain aspect ratio and cover the entire box
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
              color: Colors.grey.shade100,
              height: 160,
              width: 130,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  // Handle the onTap event if needed
                },
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the radius as needed
                  child: Image.asset(
                    MyAssetsStrings.top_collecton,
                    fit: BoxFit
                        .contain, // Use BoxFit.cover to maintain aspect ratio and cover the entire box
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
              height: 160,
              width: 130,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  // Handle the onTap event if needed
                },
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the radius as needed
                  child: Image.asset(
                    MyAssetsStrings.elegant_dress,
                    fit: BoxFit
                        .contain, // Use BoxFit.cover to maintain aspect ratio and cover the entire box
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

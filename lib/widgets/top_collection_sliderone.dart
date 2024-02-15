import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class TopCollectionSliderOne extends StatelessWidget {
  const TopCollectionSliderOne({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(height: 141.03,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (BuildContext context,int index){
            return SizedBox(width: 7,);
          },
          itemBuilder: (BuildContext  context,int index){
            return InkWell(
              child: Image.asset(
                MyAssetsStrings.slimbeauty,
                height: 141.03,
                width: 312,
              ),
            );}
      ),
    );
  }

}


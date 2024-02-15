import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class TopCollectionSliderTwo extends StatelessWidget {
  const TopCollectionSliderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(height: 229,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (BuildContext context,int index){
            return SizedBox(width: 7,);
          },
          itemBuilder: (BuildContext  context,int index){
            return InkWell(
              child: Image.asset(
                MyAssetsStrings.mostsexy,
                height: 229,
                width: 312,
              ),
            );}
      ),
    );
  }

}


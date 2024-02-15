import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class HangOutSlider extends StatelessWidget {
  const HangOutSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (BuildContext context,int index){
          return SizedBox(width: 7,);
        },
        itemBuilder: (BuildContext  context,int index){
        return InkWell(onTap: (){},
          child: Image.asset(
            MyAssetsStrings.hangout,
            height: 158,
            width: 424,
          ),
        );}
      ),
    );
  }
}

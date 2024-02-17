import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';

class IntroPageSideWidget extends StatelessWidget {
  bool designinRight;
  IntroPageSideWidget({
    super.key,
    required this.designinRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(designinRight ? 12.0 : 0.0),
          bottomRight: Radius.circular(designinRight ? 12.0 : 0.0),
          topLeft: Radius.circular(designinRight ? 0.0 : 12.0),
          bottomLeft: Radius.circular(designinRight ? 0.0 : 12.0),
        ),
        // topLeft: Radius.circular(12.0), bottomLeft: Radius.circular(12.0)),
        color: Color(int.parse(MyColor.myColorThree)),
      ),
      height: 261,
      width: 27,
    );
  }
}

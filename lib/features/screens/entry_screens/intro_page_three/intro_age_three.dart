import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/navigation_bar/navigation_bar.dart';

class IntroPageThree extends StatefulWidget {
  const IntroPageThree({super.key});

  @override
  State<IntroPageThree> createState() => _IntroPageThreeState();
}

class _IntroPageThreeState extends State<IntroPageThree> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(children: [
      Container(
        color: Color(int.parse(MyColor.myColorFive)),
      ),

      Container(
        padding: EdgeInsets.only(top: 780),
        height: 351,
        width: 375,
        color: Colors.white,
      ),
      Column(
        children: [
          Container(
            child: Center(
              child: Text(
                My_Strings.Explore_your_true_style,
                style: TextStyle(
                  fontFamily:MY_Assets_Strings.productSans,
                  color: Color(
                    int.parse(MyColor.myColorFour)
                  ),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(bottom: 450),
        child: Center(
          child: Text(
            My_Strings.Relax_and_let_us_bring_the_style,
            style: TextStyle(
              fontFamily: MY_Assets_Strings.productSans,
              color: Color(
               int.parse(MyColor.myColorTwo)
              ),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          height: 368,
          width: 261,
          color: Color(int.parse(MyColor.myColorThree)),
        ),
      ),

      Center(
        child: Container(
          padding: EdgeInsets.only(top: 0),
          child: Image.asset(
            MY_Assets_Strings.intro_page_three_images,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 580, left: 80),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(193, 53),
            primary: Colors.grey.shade700,
            side: BorderSide(color: Colors.white, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
          onPressed: () {
            NavigateToNavigationBar();
          },
          child: Text(
            My_Strings.Shopping_now,
            style: TextStyle(
              fontFamily: MY_Assets_Strings.productSans,
              color: Color(int.parse(MyColor.myColorOne)),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]));
  }
  NavigateToNavigationBar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NavigationBarSet()));
  }
}

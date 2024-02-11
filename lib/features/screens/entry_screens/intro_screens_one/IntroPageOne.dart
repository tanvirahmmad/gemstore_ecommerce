import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/navigation_bar/navigation_bar.dart';
class IntroPageOne extends StatefulWidget {
  const IntroPageOne({super.key});

  @override
  State<IntroPageOne> createState() => _IntroPageOneState();
}

class _IntroPageOneState extends State<IntroPageOne> {
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
      Container(
        padding: EdgeInsets.only(bottom: 520),
        child: Center(
          child: Text(
            My_Strings.Discover_something_new,
            style: TextStyle(
              fontFamily: MY_Assets_Strings.productSans,
              color: Color(
                int.parse(MyColor.myColorTwo)
              ),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 450),
        child: Center(
          child: Text(
            My_Strings.Special_new_arrivals,
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
          padding: EdgeInsets.only(top: 19),
          child: Image.asset(
            MY_Assets_Strings.intro_page_one_images,
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

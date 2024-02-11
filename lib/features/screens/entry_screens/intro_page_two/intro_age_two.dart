import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/navigation_bar/navigation_bar.dart';

class IntroPageTwo extends StatefulWidget {
  const IntroPageTwo({super.key});

  @override
  State<IntroPageTwo> createState() => _IntroPageTwoState();
}

class _IntroPageTwoState extends State<IntroPageTwo> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: Stack(children: [


          Container(

            color: Colors.white,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height*.37,
              width: MediaQuery.of(context).size.width,
              color: Color(int.parse(MyColor.myColorFive)),
            ),
          ),

          Column(
              children: [
                const SizedBox(height: 70),
                Container(
                  child: Center(
                    child: Text(
                      MyStrings.update_trendy_outfit,
                      style: TextStyle(
                        fontFamily:MyAssetsStrings.productSans,
                        color: Color(
                            int.parse(MyColor.myColorFour)
                        ),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                Container(
                  child: Text(
                    MyStrings.favourite_brands,
                    style: TextStyle(
                      fontFamily: MyAssetsStrings.productSans,
                      color: Color(
                          int.parse(MyColor.myColorTwo)
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 33),
                Container(
                  height: 368,
                  width: 261,
                  color: Color(int.parse(MyColor.myColorThree)),
                  child: Image.asset(
                    MyAssetsStrings.intro_page_two_images,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 55,),

                Container(
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
                      MyStrings.shopping_now,
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productSans,
                        color: Color(int.parse(MyColor.myColorOne)),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),]
          )]));
  }
  NavigateToNavigationBar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NavigationBarSet()));
  }
}

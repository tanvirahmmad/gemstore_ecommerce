import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/models/into_screen_model.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';
import 'package:gemstore_ecommerce/widgets/intro_page_side_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPageWidget extends StatelessWidget {
  final int index;
  final int length;
  final IntroScreenModel introScreen;
  final PageController pageController;

  const IntroPageWidget({
    required this.index,
    required this.length,
    required this.introScreen,
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width,
              color: Color(int.parse(MyColor.myColorFive)),
            ),
          ),
          Center(
            child: Column(children: [
              const SizedBox(height: 25),
              Container(
                child: Center(
                  child: Text(
                    introScreen.title,
                    style: TextStyle(
                      fontFamily: MyAssetsStrings.productSans,
                      color: Color(int.parse(MyColor.myColorFour)),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                child: Text(
                  introScreen.subTitle,
                  style: TextStyle(
                    fontFamily: MyAssetsStrings.productSans,
                    color: Color(int.parse(MyColor.myColorTwo)),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: index > 0? 1 : 0,
                    child: IntroPageSideWidget(designinRight: true),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0)),
                    height: 368,
                    width: 261,
                    child: Image.asset(
                      introScreen.imagePath,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Opacity(
                    opacity: index < length - 1? 1: 0,
                    child: IntroPageSideWidget(designinRight: false),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: length,
                effect: WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  activeDotColor: Colors.white, // Color of the active dot
                  paintStyle: PaintingStyle.stroke,
                ),
                // You can choose different effects
                // Color of inactive dots
              ),
              SizedBox(
                height: 25,
              ),
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
                    MyRoutes.NavigateToNavigationBar(context);
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
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

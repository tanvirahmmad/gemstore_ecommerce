import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/intro_page_three/intro_age_three.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/intro_page_two/intro_age_two.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/intro_screens_one/IntroPageOne.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  final List<Widget> screens = [
    IntroPageOne(),
    IntroPageTwo(),
    IntroPageThree(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: screens,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 105),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: screens.length,
                effect: WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  activeDotColor: Colors.white, // Color of the active dot
                  paintStyle: PaintingStyle.stroke,
                ),
                // You can choose different effects
                // Color of inactive dots
              ),
            ),
          ),
        ],
      ),
    );
  }
}

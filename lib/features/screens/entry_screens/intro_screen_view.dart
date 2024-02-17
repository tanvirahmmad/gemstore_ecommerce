import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/models/into_screen_model.dart';
import 'package:gemstore_ecommerce/widgets/intro_page_widget.dart';

class IntroScreenView extends StatefulWidget {
  const IntroScreenView({super.key});

  @override
  State<IntroScreenView> createState() => _IntroScreenViewState();
}

class _IntroScreenViewState extends State<IntroScreenView> {
  final PageController _pageController = PageController();
  List<IntroScreenModel> introScreens = [
    IntroScreenModel(
      MyStrings.discover_something_new,
      MyStrings.special_new_arrivals,
      MyAssetsStrings.intro_page_one_images,
    ),
    IntroScreenModel(
      MyStrings.update_trendy_outfit,
      MyStrings.favourite_brands,
      MyAssetsStrings.intro_page_two_images,
    ),
    IntroScreenModel(
      MyStrings.explore_your_true_style,
      MyStrings.relax_and_let_us_bring_the_style,
      MyAssetsStrings.intro_page_three_images,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: List.generate(
        introScreens.length,
        (index) => IntroPageWidget(
          index: index,
          length: introScreens.length,
          introScreen: introScreens[index],
          pageController: _pageController,
        ),
      ),
    );
  }
}

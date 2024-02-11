import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/onboarding_state/on_boarding_state.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/onboarding_state/on_boarding_state.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/onboarding_state/on_boarding_state.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/splash_screens_bloc.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local_storage/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<SplashScreen> {
  bool isIntoShown = true;

  @override
  void initState() {
    _initPrefs();
    super.initState();
  }

  Future<void> _initPrefs() async {
    isIntoShown = await AppPreferences.isIntoShown();

    setState(() {});

    if (isIntoShown) {
      Future.delayed(const Duration(seconds: 2), () {
        MyRoutes.navigateOnBoardingPage(context);
      });
    }
  }

  void _hideButton() {
    setState(() {
      isIntoShown = false;
    });
  }

  void _onGetStartButtonPressed() {
    AppPreferences.saveIntroScreenShowed();
    splashScreensBloc.add(GetStartedButtonNavigateEvent());
    MyRoutes.navigateOnBoardingPage(context);
  }

  final SplashScreensBloc splashScreensBloc = SplashScreensBloc();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<SplashScreensBloc, SplashScreensState>(
      bloc: splashScreensBloc,
      listenWhen: (previous, current) => current is SplashStateActionState,
      buildWhen: (previous, current) => current is! SplashStateActionState,
      listener: (context, state) {
        if (state is GetStartedButtonNavigatetoIntropageOneState) {
          _hideButton();
          MyRoutes.navigateOnBoardingPage(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Image.asset(
                  MyAssetsStrings.splash_images,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.black12.withOpacity(.5),
              ),
              Positioned(
                bottom: screenHeight * 0.2,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      MyStrings.welcome_to_gemStore,
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productSans,
                        color: Color(int.parse(MyColor.myColorOne)),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      MyStrings.the_home_for_a_fasionista,
                      style: TextStyle(
                        fontFamily: MyAssetsStrings.productSans,
                        color: Color(int.parse(MyColor.myColorOne)),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Visibility(
                      visible: !isIntoShown,
                      maintainAnimation: true,
                      maintainState: true,
                      child: AnimatedOpacity(
                        duration: const Duration(
                          milliseconds: 800,
                        ),
                        opacity: isIntoShown ? 0 : 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(193, 53),
                            primary: Colors.grey.shade700,
                            side: const BorderSide(color: Colors.white, width: 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onPressed: _onGetStartButtonPressed,
                          child: Text(
                            MyStrings.get_Started,
                            style: TextStyle(
                              fontFamily: MyAssetsStrings.productSans,
                              color: Color(int.parse(MyColor.myColorOne)),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

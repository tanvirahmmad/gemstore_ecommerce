import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/onboarding_state/on_boarding_state.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/splash_screens_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
  bool isButtonPressed = true;

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isButtonPressed = prefs.getBool('isButtonPressed') ?? false;
    });
    if (isButtonPressed) {
      Future.delayed(Duration(seconds: 3), () {
        navigateto_Home_page();
      });
    }
  }

  void hideButton() {
    setState(() {
      isButtonPressed = true;
    });

    prefs.setBool('isButtonPressed', isButtonPressed);
  }

  @override
  final SplashScreensBloc splashScreensBloc = SplashScreensBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreensBloc, SplashScreensState>(
      bloc: splashScreensBloc,
      listenWhen: (previous, current) => current is SplashStateActionState,
      buildWhen: (previous, current) => current is! SplashStateActionState,
      listener: (context, state) {
        if (state is GetStartedButtonNavigatetoIntropageOneState) {
          hideButton();
          navigateOnBoarding_page();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  MY_Assets_Strings.splash_images,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black12.withOpacity(.5),
              ),
              Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                      child: Text(
                    My_Strings.Welcome_to_GemStore,
                    style: TextStyle(
                      fontFamily: MY_Assets_Strings.productSans,
                      color: Color(
                        0xffFFFFFF,
                      ),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
              Container(
                padding: EdgeInsets.only(top: 240),
                child: Center(
                  child: Text(
                    My_Strings.The_home_for_a_fasionista,
                    style: TextStyle(
                      fontFamily: MY_Assets_Strings.productSans,
                      color: Color(
                        0xffFFFFFF,
                      ),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 520, left: 88),
                  child: Visibility(
                    visible: !isButtonPressed,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedOpacity(
                      duration: Duration(
                        milliseconds: 800,
                      ),
                      opacity: isButtonPressed ? 0 : 1,
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
                          splashScreensBloc
                              .add(GetStartedButtonNavigateEvent());
                          //hideButton();
                          //navigatetointro_page();
                          // Add your button press logic here
                        },
                        child: Text(
                          My_Strings.Get_Started,
                          style: TextStyle(
                            fontFamily: MY_Assets_Strings.productSans,
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  navigateto_Home_page() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  navigateOnBoarding_page() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OnBoarding()));
  }
}

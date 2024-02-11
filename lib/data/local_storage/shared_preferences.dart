import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences._();

  static const String _isIntoShown = "isIntoShown";

  static Future<void> saveIntroScreenShowed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isIntoShown, true);
  }

  static Future<bool> isIntoShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isIntoShown) ?? false;
  }
}
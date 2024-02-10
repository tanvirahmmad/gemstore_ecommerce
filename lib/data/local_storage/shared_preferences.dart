import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  late SharedPreferences _prefs;
  bool isButtonPressed = true;
  AppPreferences._privateConstructor();

  static final AppPreferences instance = AppPreferences._privateConstructor();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  GetBool()  {
   isButtonPressed =
    _prefs.getBool('isButtonPressed') ?? false;
  }
  Future<void> hideButton() async {
    await _prefs.setBool('isButtonPressed', true);
  }
}

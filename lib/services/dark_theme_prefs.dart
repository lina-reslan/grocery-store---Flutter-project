
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {

  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value){
     SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
     prefs.setBool(THEME_STATUS,value);

  }

  bool getTheme (){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return prefs.getBool(THEME_STATUS) ?? false;
  }

}
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart' show ThemeType;

class LocalStorage{
  LocalStorage._internal();
  static const String _portTheme = 'theme';
  static late final SharedPreferences _prefs;
  
  static Future<void> init()async{
    _prefs = await SharedPreferences.getInstance();
  }
  
  static void setTheme(ThemeType themeType)async{
    await _prefs.setString(_portTheme, themeType.name);
  }
  
  static ThemeType getTheme(){
    final themType = _prefs.getString(_portTheme);
    return themType==null?ThemeType.dark:ThemeType.values.firstWhere((theme)=>theme.name==themType, orElse: ()=>ThemeType.dark);
  }
}


import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
 static late SharedPreferences prefs;

  static Future<void> init() async{
   prefs = await SharedPreferences.getInstance();

  }
  static Future<bool> saveData({required String key, required dynamic value})async{
   if (value is String){
    await prefs.setString(key , value);
   }else if(value is int){
     await prefs.setInt(key , value);
   }
   return false;
  }
  static getData(String key){
    return prefs.get(key);
  }
}
  class PrefsKeys{
   static const String token ='token';
  }

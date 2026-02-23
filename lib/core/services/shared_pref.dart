import 'package:shared_preferences/shared_preferences.dart';
class SharedPref {
  static late final SharedPreferences pref;
  static String namekey="name";
   static String imagekey="image";
   static String boolkey="isuploaded";

  static Future<void> init()
  async {
    pref = await SharedPreferences.getInstance();
  }
  static Future<void> setuserinfo(String name,String image)
  async {
    await pref.setString(namekey, name);
    await pref.setString(imagekey, image);
  }
  static Future<void> setstring(String key,String value)
  async {
    await pref.setString(key, value);
  }
  static String getstring(String key)
  {
    return pref.getString(key)??"";
  }
  static Future<void> setbool(String key,bool value)
  async {
    await pref.setBool(key, value);
  }
  static bool getbool(String key)
  {
    return pref.getBool(key)??false;
  }
}
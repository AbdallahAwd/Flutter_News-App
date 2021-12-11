import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper
{
 static SharedPreferences sharedPreferences ;

  static void init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> setData({
 @required String Key,
 @required bool isDark,
})async
  {
    return await sharedPreferences.setBool(Key, isDark);
  }

  static bool getData({@required key})
  {
    return  sharedPreferences.getBool(key);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{


   static dynamic getData({
     required String key,
      }) async
      {
        SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
        return sharedPreferences.get(key);
      }


   static  clearData() async
   {
     SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
     print('-----------------------------------sharedPreferences.clear()');

         return sharedPreferences.clear();
   }


   static  saveData({
    required String key,
    required dynamic value,
  }) async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is bool) return await sharedPreferences.setBool(key, value);
    if(value is int) return await sharedPreferences.setInt(key, value);
    return await sharedPreferences.setDouble(key, value);

  }

}
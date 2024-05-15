import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static SharedPreferences? sharedPreferences;

  static void init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static setToken(String token)async{
    await sharedPreferences!.setString('token', token);
  }

  static String? getToken(){
    return sharedPreferences!.getString('token');
  }
}
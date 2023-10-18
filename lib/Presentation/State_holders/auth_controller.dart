import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  static String? _accessToken;

  static String? get accessToken => _accessToken;

  static Future<void>setAccessToken(String token) async {
    SharedPreferences _sharePref =await SharedPreferences.getInstance();
    _sharePref.setString("access_token", token);
    _accessToken = token;

  }
 static Future<void>getAccessToken() async {
    SharedPreferences _sharePref =await SharedPreferences.getInstance();
    _accessToken =  _sharePref.getString("access_token");
  }
  static Future<void>clear() async {
    SharedPreferences _sharePref =await SharedPreferences.getInstance();
   _sharePref.clear();
  }
  static bool isLoggedIn(){
    return _accessToken!= null;
  }

}
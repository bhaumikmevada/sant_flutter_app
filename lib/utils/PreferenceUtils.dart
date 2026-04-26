

import 'package:shared_preferences/shared_preferences.dart';

import 'ConstantUtils.dart';

class PreferenceUtils{

  static SharedPreferences? sharedPreferences;
  static PreferenceUtils? preferenceUtils;
  static SharedPreferences? sharedPreferencesTheme;
  static PreferenceUtils? preferenceUtilsTheme;
  PreferenceUtils._();

  static Future<PreferenceUtils> getInstance() async{
    preferenceUtils ??= PreferenceUtils._();
    sharedPreferences = await SharedPreferences.getInstance();
    return preferenceUtils!;
  }
  static Future<PreferenceUtils> getInstanceTheme() async{
    preferenceUtilsTheme ??= PreferenceUtils._();
    sharedPreferencesTheme = await SharedPreferences.getInstance();
    return preferenceUtilsTheme!;
  }

  static void saveString(String key,String value){
     sharedPreferences?.setString(key, value);
  }

  static String getString(String key,{String defValue = ""}){
    return sharedPreferences?.getString(key) ?? defValue;
  }

  static void saveInt(String key,int value){
    sharedPreferences?.setInt(key, value);
  }

  static int getInt(String key,{int defValue = -1}){
    return sharedPreferences?.getInt(key) ?? defValue;
  }

  static void saveBoolean(String key,bool value) {
     sharedPreferences?.setBool(key, value);
  }

  static bool getBoolean(String key,{bool defValue = false}) {
    return sharedPreferences?.getBool(key) ?? defValue;
  }

  static void saveBooleanTheme(String key,bool value) {
    sharedPreferencesTheme?.setBool(key, value);
  }

  static bool getBooleanTheme(String key,{bool defValue = false}) {
    return sharedPreferencesTheme?.getBool(key) ?? defValue;
  }

  static void clearAllPref(){
    sharedPreferences?.clear();
  }

  static void removeKey(String key){
    sharedPreferences?.remove(key);
  }

  // static void storeLoginInfo(LoginModel loginModel){
  //   saveString(PREF_USER_ID, "${loginModel.userDetails?.userId.toString()}");
  //   saveString(PREF_FIRST_NAME, "${loginModel.userDetails?.fName.toString()}");
  //   saveString(PREF_LAST_NAME, "${loginModel.userDetails?.lName.toString()}");
  //   saveString(PREF_EMAIL, "${loginModel.userDetails?.email.toString()}");
  //   saveString(PREF_GENDER, "${loginModel.userDetails?.gender.toString()}");
  //   saveString(PREF_PROFILE, "${loginModel.userDetails?.image.toString()}");
  //   saveString(PREF_GOOGLE_ID, "${loginModel.userDetails?.googleid.toString()}");
  //   saveString(PREF_FACEBOOK_ID, "${loginModel.userDetails?.facebookid.toString()}");
  //   saveString(PREF_APPLE_ID, "${loginModel.userDetails?.appleid.toString()}");
  //   saveString(PREF_DELETE_STATUS, "${loginModel.userDetails?.deleteStatus.toString()}");
  // }

}
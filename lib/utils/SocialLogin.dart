import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SocialLogin{


  //TODO :  Login With FB
  static bool _isFbCheck = true;
  static AccessToken? _accessToken;
  static var _userDatafb = null;

  static Future<Map<String,dynamic>> loginFb() async{


    final accessToken = await FacebookAuth.instance.accessToken;

    _isFbCheck = false;

    if (accessToken != null) {

      print("accessToken : ${accessToken.toJson()}");

      _userDatafb = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;

    }else{

      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken;
        _userDatafb = await FacebookAuth.instance.getUserData();

      }else{
        print("FbLogin Status : ${result.status}");
        print("FbLogin Message : ${result.message}");
      }

      _isFbCheck = false;

    }

    return _userDatafb;
  }

  
  static fBLogout() async{

    await FacebookAuth.instance.logOut();

    _accessToken = null;
    _userDatafb = null;

  }

  static var _userDataApple = null;



}
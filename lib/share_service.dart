import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter_assignment/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService{
  static Future<bool> isLoggedIn() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true :false;
  }
  static Future<Void> setLoginDetails(LoginResponseModel model) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("login_details", model != null ? jsonEncode(model.toJson()) : null);
  }
  static Future<Void> logout() async{
    await setLoginDetails(null);
  }
}
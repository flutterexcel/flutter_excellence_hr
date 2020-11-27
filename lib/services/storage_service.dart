import 'dart:io';

import 'package:flutter_excellence_hr/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setUserName(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('username', value);
  }

  static String getUserName({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('username') ?? defValue;
  }

  static Future<bool> setPassword(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('password', value);
  }

  static String getPassword({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('password') ?? defValue;
  }

//get profileImg
  static String getProfileImg({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('profileImg') ?? defValue;
  }

  //set profileImg
  static Future<bool> setProfileImg(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('profileImg', value);
  }

  //get usertoken
  static String getUserToken({String defValue = ''}) {
    if (_preferences == null) return defValue;
    
    return _preferences.getString('usertoken') ?? defValue;
  }

  //set usertoken
  static Future<bool> setUserToken(String value) async {
    if (_preferences == null) return null;
   
    return _preferences.setString('usertoken', value);
  }

  //get userid
  static String getUserId({String defValue = ''}) {
    if (_preferences == null) return defValue;

    return _preferences.getString('userid') ?? defValue;
  }

  //set userid
  static Future<bool> setUserId(String value) async {
    if (_preferences == null) return null;
    
    return _preferences.setString('userid', value);
  }

  //get isLoggedIn
  static bool getLoggedIn({bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences.getBool('islogged') ?? defValue;
  }

  //set isLoggedIn
  static Future<bool> setLoggedIn(bool value) async {
    if (_preferences == null) return null;

    return _preferences.setBool('islogged', value);
  }

  static Future<bool> clear(bool value) async {
    if (_preferences == null)
      return null;
    else {
      _preferences.remove('profileImg');
      _preferences.remove('usertoken');
      _preferences.remove('userid');
      _preferences.remove('islogged');
      return null;
    }
  }
}

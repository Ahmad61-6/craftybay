import 'dart:convert';

import 'package:crafty_bay/data/models/profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  Future<void> saveUserDetails(String token, Profile profile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
    sharedPreferences.setString('profile', jsonEncode(profile.toJson()));
  }

  Future<void> initialize() async {}

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<Profile?> getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? strProfile = sharedPreferences.getString('profile');
    if (strProfile == null) {
      return null;
    } else {
      return Profile.fromJson(jsonDecode(strProfile));
    }
  }
}

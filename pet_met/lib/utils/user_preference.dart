import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'user_details.dart';

class UserPreference {
  UserDetails userDetails = UserDetails();

  String roleIdKey = 'categoryIdKey';
  String userIdKey = "userIdKey";
  String userNameKey = "userNameKey";
  String userEmailKey = "userEmailKey";
  String userProfileImageKey = "userProfileImageKey";



  /// Set Role Id Key
  Future<void> setRoleId(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(roleIdKey, value);
    userDetails.roleId = prefs.getInt(roleIdKey) ?? 0;
    log("RoleIdKey : ${prefs.getInt(roleIdKey)}");
  }


  /// Set User Login Or Register Details
  Future<void> setUserDetails(
      {required int userId,
      required String userName,
      required String userEmail,
      required String userProfileImage,
      }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(userIdKey, userId);
    prefs.setString(userNameKey, userName);
    prefs.setString(userEmailKey, userEmail);
    prefs.setString(userProfileImageKey, userProfileImage);

    userDetails.userId = prefs.getInt(userIdKey) ?? 0;
    userDetails.userName = prefs.getString(userNameKey) ?? "";
    userDetails.userEmail = prefs.getString(userEmailKey) ?? "";
    userDetails.userProfileImage = prefs.getString(userProfileImageKey) ?? "";

    log("userId : ${userDetails.userId}");
    log("userName : ${userDetails.userName}");
    log("userEmail : ${userDetails.userEmail}");
    log("userProfileImage : ${userDetails.userProfileImage}");


  }
}
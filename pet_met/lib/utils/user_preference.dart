import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'user_details.dart';

class UserPreference {
  // UserDetails userDetails = UserDetails();

  String roleIdKey = 'categoryIdKey';

  String isUserLoggedInKey = "isUserLoggedInKey";
  String userTokenKey = "userTokenKey";
  String selfIdKey = "selfIdKey";
  String userIdKey = "userIdKey";
  String userNameKey = "userNameKey";
  String userEmailKey = "userEmailKey";
  String userProfileImageKey = "userProfileImageKey";

  /// Set Role Id Key
  Future<void> setRoleId(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(roleIdKey, value);
    UserDetails.roleId = prefs.getInt(roleIdKey) ?? 0;
    log("RoleIdKey : ${prefs.getInt(roleIdKey)}");
  }

  /// Set User Login Or Register Details
  Future<void> setUserDetails({
    required int selfId,
    required int userId,
    required String userName,
    required String userEmail,
    required String userProfileImage,
    required String token,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(selfIdKey, selfId);
    prefs.setInt(userIdKey, userId);
    prefs.setString(userNameKey, userName);
    prefs.setString(userEmailKey, userEmail);
    prefs.setString(userProfileImageKey, userProfileImage);
    prefs.setString(userTokenKey, token);
    prefs.setBool(isUserLoggedInKey, true);

    UserDetails.selfId = prefs.getInt(selfIdKey) ?? 0;
    UserDetails.userId = prefs.getInt(userIdKey) ?? 0;
    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.userEmail = prefs.getString(userEmailKey) ?? "";
    UserDetails.userProfileImage = prefs.getString(userProfileImageKey) ?? "";
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;

    log("selfId : ${UserDetails.selfId}");
    log("userId : ${UserDetails.userId}");
    log("userName : ${UserDetails.userName}");
    log("userEmail : ${UserDetails.userEmail}");
    log("userProfileImage : ${UserDetails.userProfileImage}");
    log("userToken : ${UserDetails.userToken}");
    log("isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
  }

  /// Logout
  Future<void> removeUserDetails() async {
    // Set Default Value in Prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userTokenKey, "");
    prefs.setInt(selfIdKey, 0);
    prefs.setInt(userIdKey, 0);
    prefs.setString(userNameKey, "");
    prefs.setString(userEmailKey, "");
    prefs.setString(userProfileImageKey, "");

    // Get Default Value From Prefs
    UserDetails.selfId = prefs.getInt(selfIdKey) ?? 0;
    UserDetails.userId = prefs.getInt(userIdKey) ?? 0;
    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.userEmail = prefs.getString(userEmailKey) ?? "";
    UserDetails.userProfileImage = prefs.getString(userProfileImageKey) ?? "";
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
  }
}

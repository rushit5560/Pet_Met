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
  String roleId1Key = "roleIdKey";
  String userProfileImageKey = "userProfileImageKey";
  String shopNameKey = "shopNameKey";
  String shopProfileImageKey = "shopProfileImageKey";

  String userLatitudeKey = "userLatitudeKey";
  String userLongitudeKey = "userLongitudeKey";

  /// Set Role Id Key
  Future<void> setRoleId(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(roleIdKey, value);
    UserDetails.roleId = prefs.getInt(roleIdKey) ?? 0;
    log('role: ${UserDetails.roleId}');
    log("RoleIdKey : ${prefs.getInt(roleIdKey)}");
  }

  /// Set User Login Or Register Details
  Future<void> setUserDetails({
    required String selfId,
    required String userId,
    required String userName,
    required String userEmail,
    required String userProfileImage,
    required String token,
    required String roleId,
    required String shopName,
    String ? shopProfile
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selfIdKey, selfId);
    prefs.setString(userIdKey, userId);
    prefs.setString(userNameKey, userName);
    prefs.setString(userEmailKey, userEmail);
    prefs.setString(userProfileImageKey, userProfileImage);
    prefs.setString(userTokenKey, token);
    prefs.setString(roleId1Key, roleId);
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(shopNameKey, shopName);
    prefs.setString(shopProfileImageKey, shopProfile!);

    UserDetails.selfId = prefs.getString(selfIdKey) ?? "";
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.userEmail = prefs.getString(userEmailKey) ?? "";
    UserDetails.userProfileImage = prefs.getString(userProfileImageKey) ?? "";
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
    UserDetails.categoryId = prefs.getString(roleId1Key) ?? "";
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.shopName = prefs.getString(shopNameKey) ?? "";
    UserDetails.shopProfile = prefs.getString(shopProfileImageKey) ?? "";

    log("selfId : ${UserDetails.selfId}");
    log("userId : ${UserDetails.userId}");
    log("userName : ${UserDetails.userName}");
    log("userEmail : ${UserDetails.userEmail}");
    log("userProfileImage : ${UserDetails.userProfileImage}");
    log("userToken : ${UserDetails.userToken}");
    log("roleId : ${UserDetails.categoryId}");
    log("isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
    log("shopName : ${UserDetails.shopName}");
  }

  /// Set User Login Or Register Details
  // Future<void> setUserProfileDetails({
  //   required String userName,
  //   required String userProfileImage,
  // }) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt(selfIdKey, selfId);
  //   prefs.setInt(userIdKey, userId);
  //   prefs.setString(userNameKey, userName);
  //   prefs.setString(userEmailKey, userEmail);
  //   prefs.setString(userProfileImageKey, userProfileImage);
  //   prefs.setString(userTokenKey, token);
  //   prefs.setInt(roleId1Key, roleId);
  //   prefs.setBool(isUserLoggedInKey, true);
  //
  //   UserDetails.selfId = prefs.getInt(selfIdKey) ?? 0;
  //   UserDetails.userId = prefs.getInt(userIdKey) ?? 0;
  //   UserDetails.userName = prefs.getString(userNameKey) ?? "";
  //   UserDetails.userEmail = prefs.getString(userEmailKey) ?? "";
  //   UserDetails.userProfileImage = prefs.getString(userProfileImageKey) ?? "";
  //   UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
  //   UserDetails.categoryId = prefs.getInt(roleId1Key) ?? 0;
  //   UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
  //
  //   log("selfId : ${UserDetails.selfId}");
  //   log("userId : ${UserDetails.userId}");
  //   log("userName : ${UserDetails.userName}");
  //   log("userEmail : ${UserDetails.userEmail}");
  //   log("userProfileImage : ${UserDetails.userProfileImage}");
  //   log("userToken : ${UserDetails.userToken}");
  //   log("roleId : ${UserDetails.categoryId}");
  //   log("isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
  // }

  Future<void> setUserLocation({required String latitude, required String longitude}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userLatitudeKey, latitude);
    prefs.setString(userLongitudeKey, longitude);

    prefs.setString(userLatitudeKey, "21.2185");
    prefs.setString(userLongitudeKey, "72.8368");


    UserDetails.liveLatitude = prefs.getString(userLatitudeKey) ?? "";
    UserDetails.liveLongitude = prefs.getString(userLongitudeKey) ?? "";

    log("User Latitude : ${UserDetails.liveLatitude}");
    log("User Longitude : ${UserDetails.liveLongitude}");
  }

  Future<void> removeUserLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Set Default Value
    prefs.setString(userLatitudeKey, "");
    prefs.setString(userLongitudeKey, "");
    // Remove Value
    prefs.remove(userLatitudeKey);
    prefs.remove(userLongitudeKey);

    // Remove Location from local variable
    UserDetails.liveLatitude = "";
    UserDetails.liveLongitude = "";
  }

  /// Logout
  Future<void> removeUserDetails() async {
    // Set Default Value in Prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userTokenKey, "");
    prefs.setString(selfIdKey, "");
    prefs.setString(userIdKey, "");
    prefs.setString(userNameKey, "");
    prefs.setString(userEmailKey, "");
    prefs.setString(userProfileImageKey, "");
    prefs.setString(roleId1Key, "");
    prefs.setString(shopNameKey, "");
    prefs.setString(shopProfileImageKey, "");

    // Get Default Value From Prefs
    UserDetails.selfId = prefs.getString(selfIdKey) ?? "";
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.userEmail = prefs.getString(userEmailKey) ?? "";
    UserDetails.userProfileImage = prefs.getString(userProfileImageKey) ?? "";
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
    UserDetails.categoryId = prefs.getString(roleId1Key) ?? "";
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.shopName = prefs.getString(shopNameKey) ?? "";
    UserDetails.shopProfile = prefs.getString(shopProfileImageKey) ?? "";
  }
}

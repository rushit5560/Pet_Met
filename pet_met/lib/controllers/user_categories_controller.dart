import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/login_screen/login_screen.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/notification_services.dart';
import '../utils/user_details.dart';

class UserCategoriesController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;

  UserPreference userPreference = UserPreference();

  // NotificationServices notificationServices = NotificationServices();

  RxBool individualPetBool = false.obs;
  RxBool petShoopsGroomingBool = false.obs;
  RxBool petvetsandNgoBool = false.obs;
  RxBool petTrainerAndBreederBool = false.obs;

  int roleId = 0;

  // Set Role Id in Prefs
  Future<void> setRoleIdInPrefs() async {
    await userPreference.setRoleId(roleId);
    //Get.offNamed(AppRouteNames.loginRoute);
    Get.to(() => LoginScreen(),
        transition: Transition.native,
        duration: const Duration(milliseconds: 500));
  }

  var boolsList = [];

  List userTypeCategories = [
    "Pet Parents",
    "Pet Shops, Cafe & Grooming",
    "Pet Vets & Ngo",
    "Pet Trainers & Breeders",
  ];

  @override
  void onInit() {
    super.onInit();

    boolsList = [
      individualPetBool,
      petShoopsGroomingBool,
      petvetsandNgoBool,
      petTrainerAndBreederBool
    ];

    initMethod();
  }

  Future<void> initMethod() async {
    await requestNotificationPermission();
    await getLocationFunction();

    // notificationServices.firebaseNotificationGetInActiveState();
  }

  /// Get User Location Permission
  getLocationFunction() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      log('LocationPermission.denied');
      permission = await Geolocator.requestPermission();
      // if (permission == LocationPermission.denied) {
      //   getLocationFunction();
      // }
    }
    if (permission == LocationPermission.deniedForever) {
      log('LocationPermission.deniedForever');
      permission = await Geolocator.checkPermission();
      log('permission :$permission');
      if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      // getLocationFunction();
    }

    /*streamSubscription = Geolocator.getPositionStream().listen((Position position) async {
      // Current Location store in prefs
      await userPreference.setUserLocation(
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
      );
    });*/

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();
      // Current Location store in prefs
      await userPreference.setUserLocation(
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
      );
      await setValueInPrefs();
    } else {
      await userPreference.setUserLocation(
        latitude: "21.1702",
        longitude: "72.8311",
      );
      await setValueInPrefs();
    }
  }

  /// Set value in prefs
  setValueInPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool onboardingValue = prefs.getBool('onboarding') ?? false;

      /// Set User value in Local from Prefs
      UserDetails.roleId = prefs.getInt(userPreference.roleIdKey) ?? 0;
      UserDetails.isUserLoggedIn =
          prefs.getBool(userPreference.isUserLoggedInKey) ?? false;
      UserDetails.selfId = prefs.getString(userPreference.selfIdKey) ?? "";
      UserDetails.userId = prefs.getString(userPreference.userIdKey) ?? "";
      UserDetails.userName = prefs.getString(userPreference.userNameKey) ?? "";
      UserDetails.userEmail =
          prefs.getString(userPreference.userEmailKey) ?? "";
      UserDetails.userProfileImage =
          prefs.getString(userPreference.userProfileImageKey) ?? "";
      UserDetails.userToken =
          prefs.getString(userPreference.userTokenKey) ?? "";
      UserDetails.categoryId = prefs.getString(userPreference.roleId1Key) ?? "";
      UserDetails.shopName = prefs.getString(userPreference.shopNameKey) ?? "";
      UserDetails.shopProfile =
          prefs.getString(userPreference.shopProfileImageKey) ?? "";
      log('UserDetails.roleId: ${UserDetails.roleId}');
      log('UserDetails.categoryId: ${UserDetails.categoryId}');
      log('UserDetails.shopName: ${UserDetails.shopName}');

      // return Timer(
      //   const Duration(milliseconds: 2500),
      //       () {
      //     if (onboardingValue == false) {
      //       Get.offAll(
      //             () => OnboardingScreen(),
      //         transition: Transition.native,
      //       );
      //     } else if (UserDetails.isUserLoggedIn == true) {
      //       Get.offAll(
      //             () => IndexScreen(),
      //         transition: Transition.native,
      //       );
      //     } else if (UserDetails.isUserLoggedIn == false) {
      //       Get.offAll(
      //             () => const UserCategoriesScreen(),
      //         transition: Transition.native,
      //       );
      //     }
      //   },
      // );
    } catch (e) {
      log("exception is : $e");
      rethrow;
    }
  }

  /// Firebase notification Service
  Future<void> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User Granted Permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User Granted Provisional Permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }
}

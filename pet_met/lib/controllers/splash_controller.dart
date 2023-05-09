import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/screens/onboarding_screen/onboarding_screen.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/notification_services.dart';

class SplashController extends GetxController {
  final size = Get.size;

  RxDouble width1 = Get.size.width.obs;
  RxDouble height1 = Get.size.width.obs;
  UserPreference userPreference = UserPreference();
  UserDetails userDetails = UserDetails();
  late StreamSubscription<Position> streamSubscription;

  RxDouble imageHeight = (Get.height / 3.5).obs;

  NotificationServices notificationServices = NotificationServices();

  void animateImage() {
    Future.delayed(const Duration(seconds: 1), () {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        imageHeight = (Get.height / 3.5).obs;
        // log('imageHeight : $imageHeight');
        animateImage();
      });
    });
  }

  /*getLocationFunction() async {
    isLoading(true);
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied, we cannot request permissions.');
    }

    */
  /*streamSubscription = Geolocator.getPositionStream().listen((Position position) async {
      // Current Location store in prefs
      await userPreference.setUserLocation(
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
      );
    });*/
  /*

    Position position = await Geolocator.getCurrentPosition();
    // Current Location store in prefs
    await userPreference.setUserLocation(
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
    );
  }*/

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
      await redirectNextScreen();
    }
  }

  redirectNextScreen() async {
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

      return Timer(
        const Duration(milliseconds: 1500),
        () {
          if (onboardingValue == false) {
            Get.offAll(
              () => OnboardingScreen(),
              transition: Transition.native,
            );
          } else if (UserDetails.isUserLoggedIn == true) {
            Get.offAll(
              () => IndexScreen(),
              transition: Transition.native,
            );
          } else if (UserDetails.isUserLoggedIn == false) {
            Get.offAll(
              () => const UserCategoriesScreen(),
              transition: Transition.native,
            );
          }
        },
      );
    } catch (e) {
      log("exception is : $e");
      rethrow;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // animateImage();
    // getLocationFunction();
    width1.value = Get.size.width * 0.80;
    height1.value = Get.size.width * 0.80;
    Future<void> enableIOSNotifications() async {
      log("notification ios");
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
    }
    

    redirectNextScreen();
    // getLocationFunction();
    // permissionServices();

    // requestPermission();
    // notificationServices.firebaseNotificationGetInActiveState();
  }

  /*Permission services*/
  Future<PermissionStatus> permissionServices() async {
    LocationPermission permission;

    bool deniedOnce = false;

    var status = await Permission.location.status;
    log('statuses : $status');

    permission = await Geolocator.requestPermission();
    log('permission : $permission');

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (deniedOnce == false) {
        deniedOnce = true;
        // permissionServices();
        // await Geolocator.requestPermission();
      }
    }

    // if (statuses[Permission.location].isPermanentlyDenied) {
    //   await openAppSettings().then(
    //         (value) async {
    //       if (value) {
    //         if (await Permission.location.status.isPermanentlyDenied == true &&
    //             await Permission.location.status.isGranted == false) {
    //           // openAppSettings();
    //           permissionServiceCall(); / opens app settings until permission is granted /
    //       }
    //       }
    //     },
    //   );
    // }
    // else {
    //   if (statuses[Permission.location].isDenied) {
    //     permissionServiceCall();
    //   }
    // }

    return status;
  }

  // permissionServiceCall() async {
  //   await permissionServices().then(
  //     (value) {
  //       if (value[Permission.location]!.isGranted) {
  //         // Navigator.pushReplacement(
  //         // context,
  //         // MaterialPageRoute(builder: (context) => SplashScreen()),
  //         // );
  //       }
  //     },
  //   );
  // }

  void requestPermission() async {
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

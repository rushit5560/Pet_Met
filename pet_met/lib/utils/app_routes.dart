import 'package:get/get.dart';
import 'package:pet_met/screens/address_screen/address_screen.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/screens/login_screen/login_screen.dart';

import 'package:pet_met/screens/order_placed_screen/order_placed_screen.dart';
import 'package:pet_met/screens/payment_failed_screen/payment_failed_screen.dart';
import 'package:pet_met/screens/pet_meeting_and_breading_screen/pet_meeting_and_breading_screen.dart';

import 'package:pet_met/screens/pet_trainers_details_screen/pet_trainers_details_screen.dart';
import 'package:pet_met/screens/pet_vets_and_ngo_details_screen/pet_vets_and_ngo_details_screen.dart';
import 'package:pet_met/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:pet_met/screens/rate_app_screen/rate_app_screen.dart';
import 'package:pet_met/screens/register_screen/register_screen.dart';
import 'package:pet_met/screens/shop_details_screen/shop_details_screen.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen.dart';
import 'package:pet_met/screens/user_profile_edit_screen/user_profile_edit_screen.dart';

import 'package:pet_met/utils/app_route_names.dart';

import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/order_details_screen/order_details_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/user_profile_screen/user_profile_screen.dart';

class AppRoutes {
  final routes = [
    GetPage(
      name: AppRouteNames.splashRoute,
      page: () => SplashScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.onBoardingRoute,
      page: () => OnboardingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.loginRoute,
      page: () => LoginScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.registerRoute,
      page: () => RegisterScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.indexScreenRoute,
      page: () => IndexScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.homeScreenRoute,
      page: () => HomeScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.userProfileRoute,
      page: () => UserProfileScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.userProfileEditRoute,
      page: () => UserProfileEditScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.uploadPetRoute,
      page: () => UploadPetScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.rateAppRoute,
      page: () => RateAppScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petVetsAndNgoDetailsScreenRoute,
      page: () => PetVetsAndNgoDetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petTrainerDetailsScreenRoute,
      page: () => PetTrainersDetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.privacyPolicyScreenRoute,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.addressRoute,
      page: () => AddressScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.shopDetailsScreenRoute,
      page: () => ShopDetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // order processing routes
    GetPage(
      name: AppRouteNames.orderDetailsRoute,
      page: () => OrderDetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.orderPlacedRoute,
      page: () => OrderPlacedScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.paymentFailedRoute,
      page: () => PaymentFailedScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRouteNames.petMeetingAndBreadingScreenRoute,
      page: () => PetMeetingAndBreadingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

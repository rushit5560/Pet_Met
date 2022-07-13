import 'package:get/get.dart';
import 'package:pet_met/screens/about_screen/about_screen.dart';
import 'package:pet_met/screens/add_address_screen/add_address_screen.dart';
import 'package:pet_met/screens/address_screen/address_screen.dart';
import 'package:pet_met/screens/faq_screen/faq_screen.dart';
import 'package:pet_met/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/screens/load_file_screen/load_file_screen.dart';
import 'package:pet_met/screens/login_screen/login_screen.dart';
import 'package:pet_met/screens/metting_address_info_screen/metting_address_info_screen.dart';
import 'package:pet_met/screens/ngo_user_profile_screen/ngo_user_profile_screen.dart';

import 'package:pet_met/screens/order_placed_screen/order_placed_screen.dart';
import 'package:pet_met/screens/payment_failed_screen/payment_failed_screen.dart';
import 'package:pet_met/screens/pet_activity_screen/pet_activity_screen.dart';
import 'package:pet_met/screens/pet_care_info_screen/pet_care_info_screen.dart';
import 'package:pet_met/screens/pet_meeting_and_breading_screen/pet_meeting_and_breading_screen.dart';
import 'package:pet_met/screens/pet_pricing_screen/pet_pricing_screen.dart';

import 'package:pet_met/screens/pet_trainers_details_screen/pet_trainers_details_screen.dart';
import 'package:pet_met/screens/pet_vets_and_ngo_details_screen/pet_vets_and_ngo_details_screen.dart';
import 'package:pet_met/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:pet_met/screens/rate_app_screen/rate_app_screen.dart';
import 'package:pet_met/screens/register_screen/register_screen.dart';
import 'package:pet_met/screens/shop_details_screen/shop_details_screen.dart';
import 'package:pet_met/screens/shop_user_profile_screen/shop_user_profile_screen.dart';
import 'package:pet_met/screens/trainers_and_users_profile_screen/trainers_and_user_profile_screen.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:pet_met/screens/user_profile_edit_screen/user_profile_edit_screen.dart';

import 'package:pet_met/utils/app_route_names.dart';

import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/order_details_screen/order_details_screen.dart';
import '../screens/pet_meeting_details_screen/pet_meeting_details_screen.dart';
import '../screens/pet_meeting_list_screen/pet_meeting_list_screen.dart';
import '../screens/pet_tracker_pricing_screen/pet_tracker_pricing_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/support_screen/support_screen.dart';
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
    GetPage(
      name: AppRouteNames.addAddressRoute,
      page: () => AddAddressScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.forgotPassRoute,
      page: () => ForgotPasswordScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petCareInfoRoute,
      page: () => PetCareInfoScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.supportRoute,
      page: () => SupportScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.aboutRoute,
      page: () => AboutScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.faqRoute,
      page: () => FaqScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRouteNames.petMeetingListScreenRoute,
      page: () => PetMeetingListScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petMeetingDetailsScreenRoute,
      page: () => PetMeetingDetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.loadFileRoute,
      page: () => LoadFileScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petActivityRoute,
      page: () => PetActivityScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petPricingRoute,
      page: () => PetPricingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petTrackerPricingRoute,
      page: () => PetTrackerPricingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.petMettingInfoRoute,
      page: () => MettingAddressInfoScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.userCategoriesScreenRoute,
      page: () => const UserCategoriesScreen(),
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

    GetPage(
      name: AppRouteNames.shopUserProfileScreenRoute,
      page: () => ShopUserProfileScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRouteNames.ngoUserProfileScreenRoute,
      page: () => NgoUserProfileScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRouteNames.trainersAndUsersScreenRoute,
      page: () => TrainersAndUserProfileScreenController(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

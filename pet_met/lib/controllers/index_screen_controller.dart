import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/locate_screen/locate_screen.dart';
import 'package:pet_met/screens/pet_meeting_and_breading_screen/pet_meeting_and_breading_screen.dart';
import 'package:pet_met/screens/pet_trainers_screen/pet_trainers_screen.dart';
import 'package:pet_met/screens/pet_vets_and_ngo_screen/pet_vets_and_ngo_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/delete_account_screen_model/delete_account_screen_model.dart';

class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;
  UserPreference userPreference = UserPreference();

  RxInt selectedBottomIndex = 2.obs;

  var drawerController = ZoomDrawerController();

  ApiHeader apiHeader = ApiHeader();

  List screenPages = [
    PetMeetingAndBreadingScreen(),
    PetTrainersScreen(),
    HomeScreen(),
    LocateScreen(),
    PetVetsAndNgoScreen(),
  ];

  Future<void> deleteAccountFunction() async {
    isLoading(true);
    String url = ApiUrl.deleteAccountApi + "${UserDetails.userId}";
    log('Delete Account Api Url : $url');

    try {

      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Delete Account Api Response : ${response.body}");

      DeleteAccountModel deleteAccountModel = DeleteAccountModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteAccountModel.success.obs;

      if (isSuccessStatus.value) {
        //addressController.clear();
        Fluttertoast.showToast(msg: deleteAccountModel.message);
        Get.off(()=> const UserCategoriesScreen());
      } else {
        Fluttertoast.showToast(msg: deleteAccountModel.message);
      }
    } catch(e) {
      log('Delete Account Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> userLogOutFunction() async {
    await userPreference.removeUserDetails();
    Get.offAll(()=> const UserCategoriesScreen(),
        transition: Transition.native,
        duration: const Duration(milliseconds: 500));
  }

}

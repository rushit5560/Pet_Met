import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/get_pet_profile_model/get_pet_profile_model.dart';
import 'package:pet_met/models/get_pet_profile_model/pet_details_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';

class PetMeetingDetailsScreenController extends GetxController {
  String petId = Get.arguments[0];
  String petUserId = Get.arguments[1];
  String petUserCatId = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;



  ApiHeader apiHeader = ApiHeader();
  PetData getProfile = PetData();
  String image = "";
  String petName = "";
  String mettingAvailability = "";
  String dob = "";
  String details = "";

  /// Get Pet Profile
  Future<void> getProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.petProfileApi;
    log("All Pet Profile Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      Map<String, dynamic> bodyData = {
        "userid": UserDetails.userId,
        "categoryid" : UserDetails.categoryId,
        "meettingpetuserid" : petUserId,
        "meettingpetusercategory" : petUserCatId
      };
      log("bodyData : $bodyData");

      http.Response response = await http.post(
          Uri.parse(url),
          headers: header,
          body: bodyData
      );
      log("Get Pet Profile Api response : ${response.body}");

      GetPetDetailsModel getPetProfileModel = GetPetDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetProfileModel.success.obs;

      if (isSuccessStatus.value) {

         getProfile = getPetProfileModel.date[0];
         image = getPetProfileModel.date[0].image!;
         petName = getProfile.petName!;
         mettingAvailability = getProfile.meetingAvailability!;
         dob= getProfile.dob!;
         details = getProfile.details!;
         log('Image: ${getProfile.image}');
        // petNameController.text = getProfile.petName!;
        // petDetailsController.text = getProfile.details!;
        // // meetingAvailabilityValue.value = getProfile.meetingAvailability!;
        // genderValue.value = getProfile.gender!;
        // weightController.text = getProfile.weight!.toString();
        // petCategoryDropDownValue.categoryName = getProfile.mainCategory.toString();
        // petSubCategoryDropDownValue.categoryName = getProfile.subCategory.toString();
        // birthDate = getProfile.dob!;
        // petImage = getProfile.image!;
        // log('pet name: ${petNameController.text}');
        // log('pet details: ${petDetailsController.text}');
        // log('genderValue: ${genderValue.value}');
        // log('weightController: ${weightController.text}');
        // log('petCategoryDropDownValue: ${petCategoryDropDownValue.categoryName}');
        // log('petSubCategoryDropDownValue: ${petSubCategoryDropDownValue.categoryName}');
        // log('birthDate: $birthDate');
        // log('petImage: $petImage');
      } else {
        log("Pet Profile Api Else");
      }

    } catch(e) {
      log("Pet Profile Api Error ::: $e");
    } finally {
      isLoading(false);
     // await getPetCategoryFunction();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfileFunction();
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/get_pet_profile_model/get_pet_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;

class PetMeetingDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  String petId = Get.arguments;

  ApiHeader apiHeader = ApiHeader();
  PetDatum getProfile = PetDatum();
  String image = "";
  String petName = "";
  String mettingAvailability = "";
  String dob = "";
  String details = "";

  /// Get Pet Profile
  Future<void> getProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.petProfileApi + petId;
    log("All Pet Profile Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get Pet Profile Api response : ${response.body}");

      GetPetProfileModel getPetProfileModel =
      GetPetProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetProfileModel.success!.obs;

      if (isSuccessStatus.value) {

         getProfile = getPetProfileModel.data![0];
         image = getProfile.image!;
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
    // TODO: implement onInit
    super.onInit();
    getProfileFunction();
  }
}

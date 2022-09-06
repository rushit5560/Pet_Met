import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/models/get_all_category_model/get_all_category_model.dart';
import 'package:pet_met/models/get_all_sub_category_model/get_all_sub_category_model.dart';
import 'package:pet_met/models/get_pet_profile_model/get_pet_profile_model.dart';
import 'package:pet_met/models/update_pet_profile_model/update_pet_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../utils/app_colors.dart';
import 'user_profile_edit_controller.dart';

class UploadPetController extends GetxController {
  PetOption petOption = Get.arguments[0];
  String petId = Get.arguments[1] ?? "";

  // final userUpdateProfileController = Get.find<UserProfileEditController>();
  // final shopUserProfileScreenController = Get.find<ShopUserProfileScreenController>();

  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  // int petId = 0;

  final updatePetFormKey = GlobalKey<FormState>();

  var petNameController = TextEditingController();
  var petDetailsController = TextEditingController();
  var weightController = TextEditingController();

  PetDatum getProfile = PetDatum();
  RxList<PetCategory> petCategoryList =
      [PetCategory(categoryName: 'Select Category')].obs;
  PetCategory petCategoryDropDownValue = PetCategory();

  RxList<PetSubCategory> petSubCategoryList =
      [PetSubCategory(categoryName: 'Select Sub Category')].obs;
  PetSubCategory petSubCategoryDropDownValue = PetSubCategory();

  RxString selectedPetGenderValue = "Male".obs;
  RxString selectedPetTypeValue = "Grown".obs;
  RxString selectedAvailabilityValue = "Yes".obs;
  //List<Petdatum> petList = [];

  //XFile? imageFile = XFile("");
  File? imageFile;
  String? petImage;

  String month = "${DateTime.now().month}";
  String day = "${DateTime.now().day}";
  String year = "${DateTime.now().year}";

  String birthDate = "";

  String petApiCatId = "";
  String petApiSubCatId = "";

  RxString genderValue = 'Male'.obs;
  RxString meetingAvailabilityValue = 'Yes'.obs;

  String petApiProfile = "";

  List<DropdownMenuItem<String>> get dropdownPetGenderItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Male",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Male",
      ),
      DropdownMenuItem(
        child: Text(
          "Female",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Female",
      ),
      DropdownMenuItem(
        child: Text(
          "Other",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Other",
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownPetTypeItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Child",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Child",
      ),
      DropdownMenuItem(
        child: Text(
          "Adult",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Adult",
      ),
      DropdownMenuItem(
        child: Text(
          "Grown",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Grown",
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownAvailabilityItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Yes",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Yes",
      ),
      DropdownMenuItem(
        child: Text(
          "No",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "No",
      ),
    ];
    return menuItems;
  }

  /// Get Pet Category
  Future<void> getPetCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllCategoryApi;
    log("All Pet Category Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get Pet Category Api response : ${response.body}");

      GetPetCategoryModel getPetCategoryModel =
          GetPetCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        log("Success");
        petCategoryList.addAll(getPetCategoryModel.data);
        petCategoryDropDownValue = petCategoryList[0];
        log('petCategoryList : ${petCategoryList.length}');
      } else {
        log("Pet Category Api Else");
      }
    } catch (e) {
      log("Pet Category Api Error ::: $e");
    } finally {
      if (petOption == PetOption.addOption) {
        isLoading(false);
      } else if (petOption == PetOption.updateOption) {
        await getProfileFunction();
      }
    }
  }

  /// Get Sub category using cat id
  getSubCategoryUsingCategoryId(
      {required String petSubCatId, bool usingCatDDId = false}) async {
    // isLoading(true);

    String url = ApiUrl.getAllSubCategoryApi;
    String finalUrl = url + petSubCatId;
    log('Pet Sub category api url : $finalUrl');

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      http.Response response =
          await http.get(Uri.parse(finalUrl), headers: header);
      log('Sub Category response : ${response.body}');

      GetPetSubCategoryModel getPetSubCategoryModel =
          GetPetSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetSubCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        petSubCategoryList.addAll(getPetSubCategoryModel.data);
        petSubCategoryDropDownValue = petSubCategoryList[0];
        log('petSubCategoryList : ${petSubCategoryList.length}');

        // When update pet that time getting pet subcategory id
        if (usingCatDDId == false) {
          if (petOption == PetOption.updateOption) {
            for (int i = 0; i < petSubCategoryList.length; i++) {
              if (petSubCategoryList[i].categoryId == petApiSubCatId) {
                petSubCategoryDropDownValue = petSubCategoryList[i];
              }
            }
          }
        }
      } else {
        log('getSubCategoryUsingCategoryId false false');
      }
    } catch (e) {
      log('getSubCategoryUsingCategoryId Error : $e');
    } finally {
      isLoading(false);
      //await getAllRoleProfileFunction();
      // if(petOption == PetOption.addOption) {
      //   isLoading(false);
      // } else if(petOption == PetOption.updateOption){
      //   await getProfileFunction();
      // }
    }
  }

  /*/// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": "${UserDetails.userId}",
        "uid": "${UserDetails.selfId}",
        "categoryid": "${UserDetails.categoryId}",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      AllRoleProfileModel allRoleProfileModel =
      AllRoleProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRoleProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(allRoleProfileModel.data.petdata);
        log("petList Length : ${petList.length}");

        for(int i=0; i < petList.length; i++){
          petId = allRoleProfileModel.data.petdata[i].id;
          log('petId: $petId');
        }
      } else {
        log("Get All Role Profile Api Else");
      }

    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      //await getProfileFunction();

    }
  }*/

  /// Get Pet Profile
  Future<void> getProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.petDetailsApi + petId;
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
        petNameController.text = getProfile.petName!;
        petDetailsController.text = getProfile.details!;
        weightController.text = getProfile.weight!.toString();
        weightController.text = getProfile.weight!.toString();
        //meetingAvailabilityValue.value = getProfile.meetingAvailability!;
        birthDate = getProfile.dob!;
        //genderValue.value = getProfile.gender!;
        petApiCatId = "${getProfile.mainCategory}";
        petApiSubCatId = "${getProfile.subCategory}";

        // Set Gender From Api
        String gender = getProfile.gender!;
        if (gender == "male") {
          genderValue = "Male".obs;
        } else if (gender == "female") {
          genderValue = "Female".obs;
        }

        String meeting = getProfile.meetingAvailability!;
        if (meeting == "0") {
          meetingAvailabilityValue = "Yes".obs;
        } else if (meeting == "1") {
          meetingAvailabilityValue = "No".obs;
        }

        log("petApiCatId : $petApiCatId");
        log("petApiSubCatId : $petApiSubCatId");
        log("meetingAvailabilityValue: $meetingAvailabilityValue");

        // Get Pet category
        for (int i = 0; i < petCategoryList.length; i++) {
          if (petCategoryList[i].categoryId == getProfile.mainCategory) {
            petCategoryDropDownValue = petCategoryList[i];
          }
        }

        /*// Get DOB of Pet
        if (getProfile.dob != "") {
          String birthdate1 = getProfile.dob!;
          List<String> bDate = birthdate1.split('-');
          year = bDate[0];
          month = bDate[1];
          day = bDate[2];
        }*/
        // Get DOB of Pet
        if (birthDate != "") {
          String birthdate1 = birthDate;
          List<String> bDate = birthdate1.split('-');
          day = bDate[0];
          month = bDate[1];
          year = bDate[2];
        }
        log('day : $day');
        log('month : $month');
        log('year : $year');

        // petApiProfile
        if (getPetProfileModel.data![0].image != "") {
          // For split image
          List<String> profileSplitImageList =
              getPetProfileModel.data![0].image!.split('/');
          for (int i = 0; i < profileSplitImageList.length; i++) {
            log("profileSplitImageList : ${profileSplitImageList[i]}");
          }
          petApiProfile = profileSplitImageList[3];
          log('petApiProfile: $petApiProfile');
        }

        petImage = ApiUrl.apiImagePath + getProfile.image!;
        log('pet name: ${petNameController.text}');
        log('pet details: ${petDetailsController.text}');
        log('genderValue: ${genderValue.value}');
        log('weightController: ${weightController.text}');
        log('petCategoryDropDownValue: ${petCategoryDropDownValue.categoryName}');
        log('petSubCategoryDropDownValue: ${petSubCategoryDropDownValue.categoryName}');
        log('petImage: $petImage');
      } else {
        log("Pet Profile Api Else");
      }
    } catch (e) {
      log("Pet Profile Api Error ::: $e");
    } finally {
      if (petOption == PetOption.updateOption) {
        await getSubCategoryUsingCategoryId(petSubCatId: petApiCatId);
      } else {
        isLoading(false);
      }
    }
  }

  /// Update Pet profile
  updatePetProfileFunction() async {
    isLoading(true);

    // Set 0 Before Day & Month Value
    String d = day;
    String m = month;
    for (int i = 1; i < 10; i++) {
      if (i.toString() == day) {
        d = "0$day";
      }
    }
    for (int i = 1; i < 10; i++) {
      if (i.toString() == month) {
        m = "0$month";
      }
    }
    birthDate = d + "-" + m + "-" + year;

    // birthDate = day + "-" + month + "-" + year;
    log('birthDate: $birthDate');

    String url = ApiUrl.petUpdateProfileApi;
    log("Update Pet Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(header);

      // Profile Image
      if (imageFile != null) {
        var stream = http.ByteStream(imageFile!.openRead());
        stream.cast();
        var length = await imageFile!.length();
        request.files
            .add(await http.MultipartFile.fromPath("image", imageFile!.path));
        var multiPart = http.MultipartFile('image', stream, length);
        request.files.add(multiPart);
      } else if (imageFile == null) {
        request.fields['showimg'] = petApiProfile;
      }

      request.fields['pet_name'] = petNameController.text.trim();
      request.fields['main_category'] =
          "${petCategoryDropDownValue.categoryId}";
      request.fields['sub_category'] =
          "${petSubCategoryDropDownValue.categoryId}";
      request.fields['dob'] = birthDate;
      request.fields['weight'] = weightController.text.trim();
      request.fields['details'] = petDetailsController.text.trim();
      request.fields['gender'] = genderValue.value.toLowerCase();
      request.fields['userid'] = UserDetails.selfId;
      request.fields['petid'] = petId;
      request.fields['categoryID'] = UserDetails.categoryId;
      request.fields['meeting_availability'] =
          meetingAvailabilityValue.value == "Yes"
              ? "0"
              : "1" /*meetingAvailabilityValue.value*/;

      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        UpdatePetProfileModel updatePetProfileModel =
            UpdatePetProfileModel.fromJson(json.decode(value));
        log('response1 :::::: ${updatePetProfileModel.success}');
        isSuccessStatus = updatePetProfileModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: updatePetProfileModel.message);
          // if(UserDetails.categoryId == "1") {
          //   await userUpdateProfileController.getAllRoleProfileFunction();
          // } else if(UserDetails.categoryId == "2") {
          //   await shopUserProfileScreenController.getAllRoleProfileFunction();
          // }
          Get.back();
        } else {
          log('False False');
        }
      });
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Pet profile
  addPetProfileFunction() async {
    isLoading(true);

    // birthDate = day + "-" + month + "-" + year;
    // log('birthDate: $birthDate');

    // Set 0 Before Day & Month Value
    String d = day;
    String m = month;
    for (int i = 1; i < 10; i++) {
      if (i.toString() == day) {
        d = "0$day";
      }
    }
    for (int i = 1; i < 10; i++) {
      if (i.toString() == month) {
        m = "0$month";
      }
    }
    birthDate = d + "-" + m + "-" + year;

    String url = ApiUrl.petUpdateProfileApi;
    log("Update Pet Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      //if (imageFile != null) {
      log("uploading with a photo");
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var stream = http.ByteStream(imageFile!.openRead());
      stream.cast();

      var length = await imageFile!.length();

      request.files
          .add(await http.MultipartFile.fromPath("image", imageFile!.path));
      request.headers.addAll(header);

      request.fields['pet_name'] = petNameController.text.trim();
      request.fields['main_category'] =
          "${petCategoryDropDownValue.categoryId}";
      request.fields['sub_category'] =
          "${petSubCategoryDropDownValue.categoryId}";
      request.fields['dob'] = birthDate;
      request.fields['weight'] = weightController.text.trim();
      request.fields['details'] = petDetailsController.text.trim();
      request.fields['gender'] = genderValue.value.toLowerCase();
      request.fields['userid'] = UserDetails.selfId;
      request.fields['categoryID'] = UserDetails.categoryId;
      request.fields['meeting_availability'] =
          meetingAvailabilityValue.value == "Yes" ? "0" : "1";
      //request.fields['petid'] = "$petId";
      //request.fields['showimg'] = "jgjadg";

      var multiPart = http.MultipartFile(
        'image',
        stream,
        length,

        //filename: "",
      );

      // var multiFile = await http.MultipartFile.fromPath(
      //  "image",
      //   file!.path,
      // );

      request.files.add(multiPart);

      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');
      //log('request.files length : ${request.files.length}');
      //log('request.files name : ${request.files.first.filename}');
      //log('request.files filetype : ${request.files.first.contentType}');
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        UpdatePetProfileModel updatePetProfileModel =
            UpdatePetProfileModel.fromJson(json.decode(value));
        log('response1 :::::: ${updatePetProfileModel.success}');
        isSuccessStatus = updatePetProfileModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: updatePetProfileModel.message);
          // if(UserDetails.categoryId == "1") {
          //   await userUpdateProfileController.getAllRoleProfileFunction();
          // } else if(UserDetails.categoryId == "2") {
          //   await shopUserProfileScreenController.getAllRoleProfileFunction();
          // }
          Get.back();
        } else {
          log('False False');
        }
      });
      // }
      /*else {
        print("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(header);

        request.fields['pet_name'] = petNameController.text.trim();
        request.fields['main_category'] = "${petCategoryDropDownValue.categoryId}";
        request.fields['sub_category'] = "${petSubCategoryDropDownValue.categoryId}";
        request.fields['dob'] = birthDate;
        request.fields['weight'] = weightController.text.trim();
        request.fields['details'] = petDetailsController.text.trim();
        request.fields['gender'] = genderValue.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['petid'] = "$petId";
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'file',
        //   stream,
        //   length,
        // );
        //
        // request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          UpdatePetProfileModel updatePetProfileModel =
          UpdatePetProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updatePetProfileModel.success}');
          isSuccessStatus = updatePetProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updatePetProfileModel.message);
            await getProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }*/
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() async {
    super.onInit();
    getPetCategoryFunction();
    petSubCategoryDropDownValue = petSubCategoryList[0];

    DateTime date = DateTime.now();
    day = "${date.day}";
    month = "${date.month}";
    year = "${date.year}";

    // if(petOption == PetOption.addOption) {
    //   getPetCategoryFunction();
    // } else if(petOption == PetOption.updateOption) {
    //   getProfileFunction();
    // }
  }
}

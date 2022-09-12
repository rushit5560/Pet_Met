import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/models/multi_account_user_model/multiple_account_user_model.dart';
import 'package:pet_met/models/user_update_profile_model/user_update_profile_model.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class UserProfileEditController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final formKey = GlobalKey<FormState>();
  ApiHeader apiHeader = ApiHeader();

  String birthDate = "";
  String month = "${DateTime.now().month}";
  String day = "${DateTime.now().day}";
  String year = "${DateTime.now().year}";

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var locationController = TextEditingController();
  var detailsController = TextEditingController();
  var instagramController = TextEditingController();
  var facebookController = TextEditingController();

  var passwordController = TextEditingController();

  RxBool isPasswordVisible = true.obs;

  File? imageFile;
  String userProfile = "";

  RxString selectedGenderValue = 'Male'.obs;
  RxString userEmail = "".obs;
  RxString userName = "".obs;
  RxString shopEmail = "".obs;
  RxString shopName = "".obs;
  RxString ngoEmail = "".obs;
  RxString ngoName = "".obs;
  RxString trainerEmail = "".obs;
  RxString trainerName = "".obs;
  List<Petdatum> petList = [];

  bool userProfileAvail = false;
  bool shopProfileAvail = false;
  bool vetNgoProfileAvail = false;
  bool trainerProfileAvail = false;

  String userApiProfile = "";

  UserPreference userPreference = UserPreference();

  /// Get User Profile
  Future<void> getAllRoleProfileFunction(
      {ProfileChangeOption profileChangeOption =
          ProfileChangeOption.stay}) async {
    isLoading(true);
    birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All User Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(
        Uri.parse(url),
        body: data, /*headers: header*/
      );
      log("Get All User Profile Api response : ${response.body}");

      GetUserProfileModel getUserProfileModel =
          GetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(getUserProfileModel.data.petdata);

        userProfile = ApiUrl.apiImagePath +
            "asset/uploads/product/" +
            getUserProfileModel.data.data[0].image;
        nameController.text = getUserProfileModel.data.data[0].name;
        mobileController.text = getUserProfileModel.data.data[0].phone;
        emailController.text = getUserProfileModel.data.data[0].email;
        birthDate = getUserProfileModel.data.data[0].bod;
        detailsController.text = getUserProfileModel.data.data[0].fullText;
        facebookController.text = getUserProfileModel.data.data[0].facebook;
        instagramController.text = getUserProfileModel.data.data[0].instagram;

        await userPreference.setUserDetails(
          selfId: UserDetails.selfId,
          userId: UserDetails.selfId,
          userName: getUserProfileModel.data.data[0].name,
          userEmail: getUserProfileModel.data.data[0].email,
          userProfileImage: userProfile,
          token: getUserProfileModel.data.data[0].rememberToken,
          roleId: UserDetails.categoryId,
          shopName: "",
          shopProfile: "",
        );

        // Set Gender From Api
        String gender = getUserProfileModel.data.data[0].gender;
        if (gender == "male") {
          selectedGenderValue = "Male".obs;
        } else if (gender == "female") {
          selectedGenderValue = "Female".obs;
        }

        log('name: ${nameController.text}');
        log('mobile: ${mobileController.text}');
        log('gender: ${getUserProfileModel.data.data[0].gender}');

        // Get DOB of Pet
        if (birthDate != "") {
          String birthdate1 = birthDate;
          List<String> bDate = birthdate1.split('-');
          day = bDate[0];
          month = bDate[1];
          year = bDate[2];
        }

        // userApiProfile
        if (getUserProfileModel.data.data[0].image != "") {
          List<String> profileSplitImageList =
              getUserProfileModel.data.data[0].image.split('/');
          for (int i = 0; i < profileSplitImageList.length; i++) {
            log("profileSplitImageList : ${profileSplitImageList[i]}");
          }
          userApiProfile = profileSplitImageList[0];
        }

        // if(profileChangeOption == ProfileChangeOption.back) {
        //   Get.back();
        // }

      } else {
        log("Get All User Profile Api Else");
      }
    } catch (e) {
      log("Get USer Profile Api Error ::: $e");
    } /*finally {
      //isLoading(false);
      await multiAccountFunction();
    }*/

    await multiAccountFunction();
  }

  multiAccountFunction() async {
    isLoading(true);
    String url = ApiUrl.multiAccountApi;
    log("Multi account Api Url : $url");

    try {
      Map<String, dynamic> data = {"email": emailController.text.trim()};

      log("Multiple Account Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(
        Uri.parse(url),
        body: data, /*headers: header*/
      );
      log("Multiple Account Api response : ${response.body}");

      MultiAccountUserModel multiAccountUserModel =
          MultiAccountUserModel.fromJson(json.decode(response.body));
      isSuccessStatus = multiAccountUserModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        userProfileAvail =
            multiAccountUserModel.data.user.categoryID == "" ? false : true;
        shopProfileAvail =
            multiAccountUserModel.data.shop.categoryID == "" ? false : true;
        vetNgoProfileAvail =
            multiAccountUserModel.data.vetNgo.categoryID == "" ? false : true;
        trainerProfileAvail =
            multiAccountUserModel.data.trainer.categoryID == "" ? false : true;

        log("data.user : ${multiAccountUserModel.data.user.categoryID}");
        log("data.shop : ${multiAccountUserModel.data.shop.categoryID}");
        log("data.vetNgo : ${multiAccountUserModel.data.vetNgo.categoryID}");
        log("data.trainer : ${multiAccountUserModel.data.trainer.categoryID}");

        log('userProfileAvail1: $userProfileAvail');
        log('shopProfileAvail1: $shopProfileAvail');
        log('vetNgoProfileAvail1: $vetNgoProfileAvail');
        log('trainerProfileAvail1: $trainerProfileAvail');

        userEmail.value = multiAccountUserModel.data.user.email;
        userName.value = multiAccountUserModel.data.user.name;

        shopEmail.value = "${multiAccountUserModel.data.shop.email}";
        shopName.value = "${multiAccountUserModel.data.shop.name}";
        log('shopName: $shopName');

        ngoEmail.value = "${multiAccountUserModel.data.vetNgo.email}";
        ngoName.value = "${multiAccountUserModel.data.vetNgo.name}";
        log('ngoName: ${ngoName.value}');

        trainerEmail.value = "${multiAccountUserModel.data.trainer.email}";
        trainerName.value = "${multiAccountUserModel.data.trainer.name}";
      } else {
        log("Get Multi Account Api Else");
        //await unfollowUserFunction();
      }
    } catch (e) {
      log("All Multi Account Api Error ::: $e");
    } finally {
      isLoading(false);
      //await followStatus();
    }
  }

  /*Future<void> userLoginFunction({required String email, required categoryId}) async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('Login Api Url : $url');

    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": passwordController.text.trim(),
        "categoryID": "$categoryId",
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Login Api Response : ${response.body}");

      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      isSuccessStatus = loginModel.success.obs;

      if (isSuccessStatus.value) {
        // User Data Set in Prefs
        await userPreference.setUserDetails(
          selfId: loginModel.data.uid,
          userId: loginModel.data.id,
          userName: loginModel.data.name,
          userEmail: loginModel.data.email,
          userProfileImage: loginModel.data.image,
          token: loginModel.data.rememberToken,
          roleId: loginModel.data.categoryId,
          shopName: loginModel.data.shopename,
          shopProfile: loginModel.data.showimg,
        );
        passwordController.clear();
        //await userPreference.setRoleId(roleId);
        // Going to Index Screen
        Get.offAll(() => IndexScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500));
      } else {
        Fluttertoast.showToast(msg: loginModel.error);
      }
    } catch (e) {
      log('User Login Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }*/

  Future<void> userMultipleAccountLoginFunction(
      {required String email, required categoryId}) async {
    isLoading(true);
    String url = ApiUrl.multipleAccountLoginApi;
    log('Login Api Url : $url');

    try {
      Map<String, dynamic> data = {
        "email": email,
        "categoryID": "$categoryId",
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Login Api Response : ${response.body}");

      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      isSuccessStatus = loginModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');
      if (isSuccessStatus.value) {
        // User Data Set in Prefs
        await userPreference.setUserDetails(
          selfId: loginModel.data.uid,
          userId: loginModel.data.id,
          userName: loginModel.data.name,
          userEmail: loginModel.data.email,
          userProfileImage: loginModel.data.image,
          token: loginModel.data.rememberToken,
          roleId: loginModel.data.categoryId,
          shopName: loginModel.data.shopename,
          shopProfile: loginModel.data.showimg,
        );
        // passwordController.clear();
        //await userPreference.setRoleId(roleId);
        // Going to Index Screen
        Get.offAll(() => IndexScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500));
      } else {
        Fluttertoast.showToast(msg: loginModel.error);
      }
    } catch (e) {
      log('User Login Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  /// Update User profile
  updateUserProfileFunction() async {
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
    log('birthDate: $birthDate');

    String url = ApiUrl.userUpdateProfileApi;
    log("Update User Profile url: $url");

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
        request.fields['oldimage'] = userApiProfile;
      }

      request.fields['name'] = nameController.text.trim();
      request.fields['bod'] = birthDate;
      request.fields['phone'] = mobileController.text.trim();
      request.fields['gender'] = selectedGenderValue.value.toLowerCase();
      request.fields['userid'] = UserDetails.userId;
      request.fields['uid'] = UserDetails.selfId;
      request.fields['full_text'] = detailsController.text.trim();
      request.fields['instagram'] = instagramController.text.trim();
      request.fields['facebook'] = facebookController.text.trim();

      var response = await request.send();
      log('response: ${response.request}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log('value: $value');
        UpdateUserProfileModel updateUserProfileModel =
            UpdateUserProfileModel.fromJson(json.decode(value));
        log('response1 :::::: ${updateUserProfileModel.success}');
        isSuccessStatus = updateUserProfileModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "User Profile Updated Successfully");

          await getAllRoleProfileFunction(
              profileChangeOption: ProfileChangeOption.stay);
          Get.back();
        } else {
          log('False False');
        }
      });
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } /* finally {
      isLoading(false);
    }*/
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getAllRoleProfileFunction();
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/models/multi_account_user_model/multiple_account_user_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_get_profile_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_update_profile_model.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_preference.dart';

class TrainersAndUsersScreenController extends GetxController {
  final size = Get.size;
  File? imageFile;
  String ? trainersProfile;

  File? trainerPictureFile1;
  String ? trainerImage1;
  File? trainerPictureFile2;
  String ? trainerImage2;
  File? trainerPictureFile3;
  String ? trainerImage3;
  File? trainerPictureFile4;
  String ? trainerImage4;
  File? trainerPictureFile5;
  String ? trainerImage5;
  // RxString selectedGenderValue = "Male".obs;

  final formKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginPasswordForm = GlobalKey<FormState>();

  RxString userEmail = "".obs;
  RxString userName = "".obs;
  RxString shopEmail = "".obs;
  RxString shopName = "".obs;
  RxString ngoEmail = "".obs;
  RxString ngoName = "".obs;
  RxString trainerEmail = "".obs;
  RxString trainerName = "".obs;

  bool userProfileAvail = false;
  bool shopProfileAvail = false;
  bool vetNgoProfileAvail = false;
  bool trainerProfileAvail = false;

  RxBool isPasswordVisible = true.obs;

  var passwordController = TextEditingController();
  UserPreference userPreference = UserPreference();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var contactNumber = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();
  var activeController = TextEditingController();
  var instagramController = TextEditingController();
  var facebookController = TextEditingController();
  // var closeTimeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  RxString ? selectedOpenTime= "".obs;
  RxString ? selectedCloseTime= "".obs;

  RxString trainerActiveStatusValue = "Active".obs;

  String trainerApiProfile = "";
  String trainerApiProfile1 = "";
  String trainerApiProfile2 = "";
  String trainerApiProfile3 = "";
  String trainerApiProfile4 = "";
  String trainerApiProfile5 = "";

  RxBool showStatus = false.obs;

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction({ProfileChangeOption profileChangeOption =
      ProfileChangeOption.stay}) async {
    isLoading(true);
    //birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      // Map<String, String> header = apiHeader.apiHeader();
      //log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data);
      log("Get All Role Profile Api response : ${response.body}");

      GetTrainersProfileModel getTrainersProfileModel =
      GetTrainersProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getTrainersProfileModel.success.obs;

      if (isSuccessStatus.value) {
        emailController.text = getTrainersProfileModel.data.data[0].email;
        nameController.text = getTrainersProfileModel.data.data[0].name;
        contactNumber.text = getTrainersProfileModel.data.data[0].phone;
        addressController.text = getTrainersProfileModel.data.data[0].address;
        detailsController.text = getTrainersProfileModel.data.data[0].fullText;
        trainersProfile = ApiUrl.apiImagePath + getTrainersProfileModel.data.data[0].image;
        log("trainersProfile : $trainersProfile");
        // activeController.text = getTrainersProfileModel.data.data[0].isActive;
        selectedOpenTime!.value = getTrainersProfileModel.data.data[0].open;
        selectedCloseTime!.value = getTrainersProfileModel.data.data[0].close;
        instagramController.text = getTrainersProfileModel.data.data[0].instagram;
        facebookController.text = getTrainersProfileModel.data.data[0].facebook;

        trainerImage1 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image1;
        trainerImage2 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image2;
        trainerImage3 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image3;
        trainerImage4 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image4;
        trainerImage5 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image5;

        trainerApiProfile1 = getTrainersProfileModel.data.data[0].image1;
        trainerApiProfile2 = getTrainersProfileModel.data.data[0].image2;
        trainerApiProfile3 = getTrainersProfileModel.data.data[0].image3;
        trainerApiProfile4 = getTrainersProfileModel.data.data[0].image4;
        trainerApiProfile5 = getTrainersProfileModel.data.data[0].image5;

        showStatus = getTrainersProfileModel.data.showstatus.obs;

        // ngoApiProfile
        if(getTrainersProfileModel.data.data[0].image != "") {
          List<String> profileSplitImageList = getTrainersProfileModel.data.data[0]
              .image.split('/');
          for (int i = 0; i < profileSplitImageList.length; i++) {
            log("profileSplitImageList : ${profileSplitImageList[i]}");
          }
          trainerApiProfile = profileSplitImageList[3];
        }

        if (getTrainersProfileModel.data.data[0].isActive == "0") {
          trainerActiveStatusValue.value = "Active";
        } else if (getTrainersProfileModel.data.data[0].isActive == "1") {
          trainerActiveStatusValue.value = "Inactive";
        }

        await userPreference.setUserDetails(
          selfId: UserDetails.selfId,
          userId: UserDetails.selfId,
          userName: getTrainersProfileModel.data.data[0].name,
          userEmail: getTrainersProfileModel.data.data[0].email,
          userProfileImage: ApiUrl.apiImagePath + getTrainersProfileModel.data.data[0].image,
          token: "",
          roleId: UserDetails.categoryId,
          shopName: "",
          shopProfile: "",
        );

        if(profileChangeOption == ProfileChangeOption.back) {
          Get.back();
        }


      } else {
        log("Get All Role Profile Api Else");
      }

    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await multiAccountFunction();
    }
  }

  Future<void> multiAccountFunction() async {
    isLoading(true);
    String url = ApiUrl.multiAccountApi;
    log("Multi account Api Url : $url");

    try {
      Map<String, dynamic> data = {"email": UserDetails.userEmail};

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

        userProfileAvail = multiAccountUserModel.data.user.categoryID == "" ? false : true;
        shopProfileAvail = multiAccountUserModel.data.shop.categoryID == "" ? false : true;
        vetNgoProfileAvail = multiAccountUserModel.data.vetNgo.categoryID == "" ? false : true;
        trainerProfileAvail = multiAccountUserModel.data.trainer.categoryID == "" ? false : true;

        // bool userAvail = multiAccountUserModel.data.user.isEmpty ? false : true;
        // if(userAvail == true) {
        //   userProfile = true;
          userEmail.value = multiAccountUserModel.data.user.email;
          userName.value = multiAccountUserModel.data.user.name;
        // }
        //
        // bool shopAvail = multiAccountUserModel.data.shope.isEmpty ? false : true;
        // if(shopAvail == true) {
        //   shopProfile = true;
           shopEmail.value = "${multiAccountUserModel.data.shop.email}";
           shopName.value = "${multiAccountUserModel.data.shop.name}";
        // }
        //
        // bool vetNgoAvail = multiAccountUserModel.data.vetNgo.isEmpty ? false : true;
        // if(vetNgoAvail == true) {
        //   vetNgoProfile = true;
           ngoEmail.value = multiAccountUserModel.data.vetNgo.email;
           ngoName.value = multiAccountUserModel.data.vetNgo.name;
        // }
        //
        // bool trainerAvail = multiAccountUserModel.data.trainer.isEmpty ? false : true;
        // if(trainerAvail == true) {
        //   trainerProfile = true;
           trainerEmail.value = "${multiAccountUserModel.data.trainer.email}";
           trainerName.value = "${multiAccountUserModel.data.trainer.name}";
        // }


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
          shopName: "",
          shopProfile: "",
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

  Future<void> userMultipleAccountLoginFunction({required String email, required categoryId}) async {
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

  /// Update Trainer profile
  updateTrainersProfileFunction() async {
    isLoading(true);

    //birthDate = day + "-" + month + "-" + year;
    //log('birthDate: $birthDate');

    String url = ApiUrl.trainersUpdateProfileApi;
    log("Update Trainers Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {

      String trainerStatus = "";
      trainerActiveStatusValue.value == "Active"
          ? trainerStatus = "0"
          : trainerStatus = "1";

        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(header);

        // Profile Image
        if (imageFile != null) {
          var stream = http.ByteStream(imageFile!.openRead());
          stream.cast();
          var length = await imageFile!.length();
          request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
          var multiPart = http.MultipartFile('image', stream, length);
          request.files.add(multiPart);
        } else if (imageFile == null) {
          request.fields['oldimage'] = trainerApiProfile;
        }

        // For File 1
        if (trainerPictureFile1 != null) {
          var stream1 = http.ByteStream(trainerPictureFile1!.openRead());
          stream1.cast();
          var length1 = await trainerPictureFile1!.length();
          request.files.add(
              await http.MultipartFile.fromPath("image1", trainerPictureFile1!.path));
          var multiPart1 = http.MultipartFile('image1', stream1, length1);
          request.files.add(multiPart1);
        }  else if (trainerPictureFile1 == null) {
          request.fields['oldimage1'] = trainerApiProfile1;
        }

        // For File 2
        if (trainerPictureFile2 != null) {
          var stream2 = http.ByteStream(trainerPictureFile2!.openRead());
          stream2.cast();
          var length2 = await trainerPictureFile2!.length();
          request.files.add(
              await http.MultipartFile.fromPath("image2", trainerPictureFile2!.path));
          var multiPart2 = http.MultipartFile('image2', stream2, length2);
          request.files.add(multiPart2);
        } else if (trainerPictureFile2 == null) {
          request.fields['oldimage2'] = trainerApiProfile2;
        }

        // For File 3
        if (trainerPictureFile3 != null) {
          var stream3 = http.ByteStream(trainerPictureFile3!.openRead());
          stream3.cast();
          var length3 = await trainerPictureFile3!.length();
          request.files.add(
              await http.MultipartFile.fromPath("image3", trainerPictureFile3!.path));
          var multiPart3 = http.MultipartFile('image3', stream3, length3);
          request.files.add(multiPart3);
        } else if (trainerPictureFile3 == null) {
          request.fields['oldimage3'] = trainerApiProfile3;
        }

        // For File 4
        if (trainerPictureFile4 != null) {
          var stream4 = http.ByteStream(trainerPictureFile4!.openRead());
          stream4.cast();
          var length4 = await trainerPictureFile4!.length();
          request.files.add(
              await http.MultipartFile.fromPath("image4", trainerPictureFile4!.path));
          var multiPart4 = http.MultipartFile('image4', stream4, length4);
          request.files.add(multiPart4);
        } else if (trainerPictureFile4 == null) {
          request.fields['oldimage4'] = trainerApiProfile4;
        }

        // For File 5
        if (trainerPictureFile5 != null) {
          var stream5 = http.ByteStream(trainerPictureFile5!.openRead());
          stream5.cast();
          var length5 = await trainerPictureFile5!.length();
          request.files.add(
              await http.MultipartFile.fromPath("image5", trainerPictureFile5!.path));
          var multiPart5 = http.MultipartFile('image5', stream5, length5);
          request.files.add(multiPart5);
        } else  if (trainerPictureFile5 == null) {
          request.fields['oldimage5'] = trainerApiProfile5;
        }


        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactNumber.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = trainerStatus;
        request.fields['userid'] = UserDetails.selfId;
        request.fields['uid'] = UserDetails.selfId;

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          UpdateTrainersProfileModel updateTrainersProfileModel =
          UpdateTrainersProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateTrainersProfileModel.success}');
          isSuccessStatus = updateTrainersProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateTrainersProfileModel.message);
            await getAllRoleProfileFunction(profileChangeOption: ProfileChangeOption.stay);
          } else {
            log('False False');
          }
        });
      } catch (e) {
      log("updateTrainersProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  loadUI(){
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllRoleProfileFunction();
  }
}

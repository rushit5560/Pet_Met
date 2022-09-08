import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/models/multi_account_user_model/multiple_account_user_model.dart';
import 'package:pet_met/models/vet_and_ngo_update_profile_model/vet_and_ngo_update_profile_model.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';

class NgoUserProfileScreenController extends GetxController {
  final size = Get.size;
  File? imageFile;
  String? ngoProfile;

  File? ngoPictureFile1;
  String? ngoImage1;
  File? ngoPictureFile2;
  String? ngoImage2;
  File? ngoPictureFile3;
  String? ngoImage3;
  File? ngoPictureFile4;
  String? ngoImage4;
  File? ngoPictureFile5;
  String? ngoImage5;


  String ngoApiProfile = "";
  String ngoApiPicture1 = "";
  String ngoApiPicture2 = "";
  String ngoApiPicture3 = "";
  String ngoApiPicture4 = "";
  String ngoApiPicture5 = "";


  bool userProfileAvail = false;
  bool shopProfileAvail = false;
  bool vetNgoProfileAvail = false;
  bool trainerProfileAvail = false;

  RxBool isPasswordVisible = true.obs;

  RxString selectedGenderValue = "Male".obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxString ngoActiveStatusValue = "Active".obs;

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

  var passwordController = TextEditingController();
  UserPreference userPreference = UserPreference();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var accountNumberController = TextEditingController();
  var ifscCodeController = TextEditingController();
  var addressController = TextEditingController();
  var contactController = TextEditingController();
  var detailsController = TextEditingController();
  var instagramController = TextEditingController();
  var facebookController = TextEditingController();
  var activeController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();

  RxString? selectedOpenTime = "".obs;
  RxString? selectedCloseTime = "".obs;

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
      // log("header : $header");

      http.Response response = await http.post(
        Uri.parse(url),
        body: data,
      );
      log("Get All Role Profile Api response : ${response.body}");

      AllRoleProfileModel allRoleProfileModel =
          AllRoleProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRoleProfileModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');
      if (isSuccessStatus.value) {
        emailController.text = allRoleProfileModel.data.data[0].email;
        nameController.text = allRoleProfileModel.data.data[0].name;
        detailsController.text = allRoleProfileModel.data.data[0].fullText;
        instagramController.text = allRoleProfileModel.data.data[0].instagram;
        facebookController.text = allRoleProfileModel.data.data[0].facebook;
        // activeController.text = allRoleProfileModel.data.data[0].isActive;
        selectedOpenTime!.value = allRoleProfileModel.data.data[0].open;
        selectedCloseTime!.value = allRoleProfileModel.data.data[0].close;
        // //
        // log('Phone: ${contactNumber.text}');
        accountNumberController.text =
            allRoleProfileModel.data.data[0].accountCode;
        ifscCodeController.text = allRoleProfileModel.data.data[0].ifscCode;
        addressController.text = allRoleProfileModel.data.data[0].address;
        contactController.text = allRoleProfileModel.data.data[0].phone;
        ngoProfile = allRoleProfileModel.data.data[0].image;
        ngoImage1 = ApiUrl.apiImagePath + "asset/uploads/product/" + allRoleProfileModel.data.data[0].image1;
        ngoImage2 = ApiUrl.apiImagePath + "asset/uploads/product/" + allRoleProfileModel.data.data[0].image2;
        ngoImage3 = ApiUrl.apiImagePath + "asset/uploads/product/" + allRoleProfileModel.data.data[0].image3;
        ngoImage4 = ApiUrl.apiImagePath + "asset/uploads/product/" + allRoleProfileModel.data.data[0].image4;
        ngoImage5 = ApiUrl.apiImagePath + "asset/uploads/product/" + allRoleProfileModel.data.data[0].image5;

        ngoApiPicture1 = allRoleProfileModel.data.data[0].image1;
        ngoApiPicture2 = allRoleProfileModel.data.data[0].image2;
        ngoApiPicture3 = allRoleProfileModel.data.data[0].image3;
        ngoApiPicture4 = allRoleProfileModel.data.data[0].image4;
        ngoApiPicture5 = allRoleProfileModel.data.data[0].image5;

        // ngoApiProfile
        if(allRoleProfileModel.data.data[0].image != "") {
          List<String> profileSplitImageList = allRoleProfileModel.data.data[0]
              .image.split('/');
          for (int i = 0; i < profileSplitImageList.length; i++) {
            log("profileSplitImageList : ${profileSplitImageList[i]}");
          }
          ngoApiProfile = profileSplitImageList[3];
        }

        log("isActive Status : ${allRoleProfileModel.data.data[0].isActive}");
        if (allRoleProfileModel.data.data[0].isActive == "0") {
          ngoActiveStatusValue.value = "Active";
        } else if (allRoleProfileModel.data.data[0].isActive == "1") {
          ngoActiveStatusValue.value = "Inactive";
        }


        await userPreference.setUserDetails(
          selfId: UserDetails.selfId,
          userId: UserDetails.selfId,
          userName: allRoleProfileModel.data.data[0].name,
          userEmail: allRoleProfileModel.data.data[0].email,
          userProfileImage: ApiUrl.apiImagePath + allRoleProfileModel.data.data[0].image,
          token: "",
          roleId: UserDetails.categoryId,
          shopName: "",
          shopProfile: "",
        );

        if(profileChangeOption == ProfileChangeOption.back) {
          Get.back();
        }

        log('Address: ${addressController.text}');
        log('Contact: ${contactController.text}');
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await multiAccountFunction();
    }
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

  // Update Vet & NGO profile
  Future<void> updateVetAndNgoProfileFunction() async {
    isLoading(true);

    String url = ApiUrl.vetAndNgoUpdateProfileApi;
    log("Update Vet & NGO Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      String ngoStatus = "";
      ngoActiveStatusValue.value == "Active"
          ? ngoStatus = "0"
          : ngoStatus = "1";

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
        request.fields['oldimage'] = ngoApiProfile;
      }

      // For File 1
      if (ngoPictureFile1 != null) {
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        stream1.cast();
        var length1 = await ngoPictureFile1!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        var multiPart1 = http.MultipartFile('image1', stream1, length1);
        request.files.add(multiPart1);
      }  else if (ngoPictureFile1 == null) {
        request.fields['oldimage1'] = ngoApiPicture1;
      }

      // For File 2
      if (ngoPictureFile2 != null) {
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        stream2.cast();
        var length2 = await ngoPictureFile2!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        var multiPart2 = http.MultipartFile('image2', stream2, length2);
        request.files.add(multiPart2);
      } else if (ngoPictureFile2 == null) {
        request.fields['oldimage2'] = ngoApiPicture2;
      }

      // For File 3
      if (ngoPictureFile3 != null) {
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        stream3.cast();
        var length3 = await ngoPictureFile3!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        var multiPart3 = http.MultipartFile('image3', stream3, length3);
        request.files.add(multiPart3);
      } else if (ngoPictureFile3 == null) {
        request.fields['oldimage3'] = ngoApiPicture3;
      }

      // For File 4
      if (ngoPictureFile4 != null) {
        var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        stream4.cast();
        var length4 = await ngoPictureFile4!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        var multiPart4 = http.MultipartFile('image4', stream4, length4);
        request.files.add(multiPart4);
      } else if (ngoPictureFile4 == null) {
        request.fields['oldimage4'] = ngoApiPicture4;
      }

      // For File 5
      if (ngoPictureFile5 != null) {
        var stream5 = http.ByteStream(ngoPictureFile5!.openRead());
        stream5.cast();
        var length5 = await ngoPictureFile5!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        var multiPart5 = http.MultipartFile('image5', stream5, length5);
        request.files.add(multiPart5);
      } else  if (ngoPictureFile5 == null) {
        request.fields['oldimage5'] = ngoApiPicture5;
      }



      request.fields['name'] = nameController.text.trim();
      request.fields['address'] = addressController.text.trim();
      request.fields['phone'] = contactController.text.trim();
      request.fields['open'] = selectedOpenTime!.value;
      request.fields['close'] = selectedCloseTime!.value;
      request.fields['full_text'] = detailsController.text.trim();
      request.fields['instagram'] = instagramController.text.trim();
      request.fields['facebook'] = facebookController.text.trim();
      request.fields['is_active'] = ngoStatus;
      request.fields['ifsc_code'] = ifscCodeController.text.trim();
      request.fields['account_code'] = accountNumberController.text.trim();
      request.fields['userid'] = UserDetails.selfId;
      request.fields['uid'] = UserDetails.selfId;


      var response = await request.send();
      log('request.files: ${request.files}');
      log('request.fields: ${request.fields}');

      response.stream.transform(utf8.decoder).listen((value) async {
        VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel = VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
        log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
        isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
          await getAllRoleProfileFunction(profileChangeOption: ProfileChangeOption.back);
        } else {
          log('False False');
        }
      });

      /*if (imageFile != null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 != null && ngoPictureFile4 != null && ngoPictureFile5 != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(imageFile!.openRead());
        // var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        // stream.cast();
        // stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        stream5.cast();

        // var length = await imageFile!.length();
        // var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        var length3 = await ngoPictureFile3!.length();
        var length4 = await ngoPictureFile4!.length();
        var length5 = await ngoPictureFile5!.length();

        // request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        // request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        // );

        // var multiPart1 = http.MultipartFile(
        //   'image1',
        //   stream1,
        //   length1,
        // );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        var multiPart3 = http.MultipartFile(
          'image3',
          stream3,
          length3,
        );
        var multiPart4 = http.MultipartFile(
          'image4',
          stream4,
          length4,
        );
        var multiPart5 = http.MultipartFile(
          'image5',
          stream5,
          length5,
        );


        request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        request.files.add(multiPart3);
        request.files.add(multiPart4);
        request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile != null && ngoPictureFile1 == null && ngoPictureFile2 == null && ngoPictureFile3 == null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        // var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        // var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        // var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        stream.cast();
        // stream1.cast();
        // stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        // var length1 = await ngoPictureFile1!.length();
        // var length2 = await ngoPictureFile2!.length();
        // var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        // request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        // request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;


        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        // var multiPart1 = http.MultipartFile(
        //   'image1',
        //   stream1,
        //   length1,
        // );
        // var multiPart2 = http.MultipartFile(
        //   'image2',
        //   stream2,
        //   length2,
        // );
        // var multiPart3 = http.MultipartFile(
        //   'image3',
        //   stream3,
        //   length3,
        // );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        request.files.add(multiPart);
        // request.files.add(multiPart1);
        // request.files.add(multiPart2);
        // request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile != null && ngoPictureFile1 != null && ngoPictureFile2 == null && ngoPictureFile3 == null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        // var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        // var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        stream.cast();
        stream1.cast();
        // stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        // var length2 = await ngoPictureFile2!.length();
        // var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        // request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        // var multiPart2 = http.MultipartFile(
        //   'image2',
        //   stream2,
        //   length2,
        // );
        // var multiPart3 = http.MultipartFile(
        //   'image3',
        //   stream3,
        //   length3,
        // );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        request.files.add(multiPart);
        request.files.add(multiPart1);
        // request.files.add(multiPart2);
        // request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile != null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 == null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        // var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        // var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        // var multiPart3 = http.MultipartFile(
        //   'image3',
        //   stream3,
        //   length3,
        // );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        // request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile != null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 != null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        // stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        var multiPart3 = http.MultipartFile(
          'image3',
          stream3,
          length3,
        );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile != null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 != null && ngoPictureFile4 != null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        var length3 = await ngoPictureFile3!.length();
        var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        var multiPart3 = http.MultipartFile(
          'image3',
          stream3,
          length3,
        );
        var multiPart4 = http.MultipartFile(
          'image4',
          stream4,
          length4,
        );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        request.files.add(multiPart3);
        request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile == null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 != null && ngoPictureFile4 != null && ngoPictureFile5 != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
         var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

       // stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        var length3 = await ngoPictureFile3!.length();
        var length4 = await ngoPictureFile4!.length();
        var length5 = await ngoPictureFile5!.length();

        //request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        //
        //   //filename: "",
        // );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        var multiPart3 = http.MultipartFile(
          'image3',
          stream3,
          length3,
        );
        var multiPart4 = http.MultipartFile(
          'image4',
          stream4,
          length4,
        );
        var multiPart5 = http.MultipartFile(
          'image5',
          stream5,
          length5,
        );


        //request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        request.files.add(multiPart3);
        request.files.add(multiPart4);
        request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile == null && ngoPictureFile1 != null && ngoPictureFile2 == null && ngoPictureFile3 == null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        // var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        // var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        // stream.cast();
        stream1.cast();
        // stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        // var length2 = await ngoPictureFile2!.length();
        // var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        //request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        // request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        //
        //   //filename: "",
        // );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        // var multiPart2 = http.MultipartFile(
        //   'image2',
        //   stream2,
        //   length2,
        // );
        // var multiPart3 = http.MultipartFile(
        //   'image3',
        //   stream3,
        //   length3,
        // );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        //request.files.add(multiPart);
        request.files.add(multiPart1);
        // request.files.add(multiPart2);
        // request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile == null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 == null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        // var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        // stream.cast();
        stream1.cast();
        stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        // var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        //request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        //
        //   //filename: "",
        // );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        // var multiPart3 = http.MultipartFile(
        //   'image3',
        //   stream3,
        //   length3,
        // );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        //request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        // request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile == null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 != null && ngoPictureFile4 == null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        // var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        // stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        // stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        var length3 = await ngoPictureFile3!.length();
        // var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        //request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        //
        //   //filename: "",
        // );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        var multiPart3 = http.MultipartFile(
          'image3',
          stream3,
          length3,
        );
        // var multiPart4 = http.MultipartFile(
        //   'image4',
        //   stream4,
        //   length4,
        // );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        //request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        request.files.add(multiPart3);
        // request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile == null && ngoPictureFile1 != null && ngoPictureFile2 != null && ngoPictureFile3 != null && ngoPictureFile4 != null && ngoPictureFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(ngoPictureFile1!.openRead());
        var stream2 = http.ByteStream(ngoPictureFile2!.openRead());
        var stream3 = http.ByteStream(ngoPictureFile3!.openRead());
        var stream4 = http.ByteStream(ngoPictureFile4!.openRead());
        // var stream5 = http.ByteStream(ngoPictureFile5!.openRead());

        // stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await ngoPictureFile1!.length();
        var length2 = await ngoPictureFile2!.length();
        var length3 = await ngoPictureFile3!.length();
        var length4 = await ngoPictureFile4!.length();
        // var length5 = await ngoPictureFile5!.length();

        //request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", ngoPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", ngoPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", ngoPictureFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", ngoPictureFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", ngoPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        //
        //   //filename: "",
        // );

        var multiPart1 = http.MultipartFile(
          'image1',
          stream1,
          length1,
        );
        var multiPart2 = http.MultipartFile(
          'image2',
          stream2,
          length2,
        );
        var multiPart3 = http.MultipartFile(
          'image3',
          stream3,
          length3,
        );
        var multiPart4 = http.MultipartFile(
          'image4',
          stream4,
          length4,
        );
        // var multiPart5 = http.MultipartFile(
        //   'image5',
        //   stream5,
        //   length5,
        // );


        //request.files.add(multiPart);
        request.files.add(multiPart1);
        request.files.add(multiPart2);
        request.files.add(multiPart3);
        request.files.add(multiPart4);
        // request.files.add(multiPart5);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
      else if (imageFile == null && ngoPictureFile1 == null && ngoPictureFile2 == null && ngoPictureFile3 == null && ngoPictureFile4 == null && ngoPictureFile5 == null){
        log("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactController.text.trim();
        request.fields['open'] = selectedOpenTime!.value;
        request.fields['close'] = selectedCloseTime!.value;
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = ngoStatus;
        request.fields['ifsc_code'] = ifscCodeController.text.trim();
        request.fields['account_code'] = accountNumberController.text.trim();
        request.fields['userid'] = UserDetails.userId;
        request.fields['uid'] = UserDetails.userId;
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
          VetAndNgoUpdateProfileModel vetAndNgoUpdateProfileModel =
          VetAndNgoUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${vetAndNgoUpdateProfileModel.success}');
          isSuccessStatus = vetAndNgoUpdateProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: vetAndNgoUpdateProfileModel.message);
            await getAllRoleProfileFunction();
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
      log("updateVetAndNgoProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    getAllRoleProfileFunction();
    super.onInit();
  }
}

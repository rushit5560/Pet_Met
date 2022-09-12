import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/models/multi_account_user_model/multiple_account_user_model.dart';
import 'package:pet_met/models/shop_update_profile_model/shop_update_profile_model.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


class ShopUserProfileScreenController extends GetxController {
  final size = Get.size;
  File? imageFile;
  String? shopImage;

  File? shopOfferFile1;
  String ? offerImage1;

  File? shopOfferFile2;
  String ? offerImage2;
  File? shopOfferFile3;
  String ? offerImage3;
  File? shopOfferFile4;
  String ? offerImage4;
  File? shopOfferFile5;
  String ? offerImage5;

  final formKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var contactNumber = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();
  var instagramController = TextEditingController();
  var facebookController = TextEditingController();

  late Razorpay _razorpay;

  RxBool isPasswordVisible = true.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  // String birthDate = "";
  // String month= "";
  // String day = "";
  // String year = "";

  RxString userEmail = "".obs;
  RxString userName = "".obs;
  RxString shopEmail = "".obs;
  RxString shopName = "".obs;
  RxString ngoEmail = "".obs;
  RxString ngoName = "".obs;
  RxString trainerEmail = "".obs;
  RxString trainerName = "".obs;
  //DateTime selectedDate = DateTime.now();
  RxString ? selectedOpenTime= "".obs;
  RxString ? selectedCloseTime= "".obs;

  var passwordController = TextEditingController();
  UserPreference userPreference = UserPreference();

  List<String> meetingImagesList = [];

  ApiHeader apiHeader = ApiHeader();

  List<ShopPet> petList = [];

  String shopApiProfile = "";
  String shopApiPicture1 = "";
  String shopApiPicture2 = "";
  String shopApiPicture3 = "";
  String shopApiPicture4 = "";
  String shopApiPicture5 = "";

  bool userProfileAvail = false;
  bool shopProfileAvail = false;
  bool vetNgoProfileAvail = false;
  bool trainerProfileAvail = false;

  RxBool showStatus = false.obs;

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction({ProfileChangeOption profileChangeOption =
      ProfileChangeOption.stay}) async {
    isLoading(true);
    // birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetShopProfileModel getShopProfileModel =
      GetShopProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getShopProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(getShopProfileModel.data.petdata);

        nameController.text = getShopProfileModel.data.data[0].shopename;
        emailController.text = getShopProfileModel.data.data[0].email;
        contactNumber.text = getShopProfileModel.data.data[0].phonenumber.toString();
        addressController.text = getShopProfileModel.data.data[0].address;
        detailsController.text = getShopProfileModel.data.data[0].fullText;
        selectedOpenTime!.value = getShopProfileModel.data.data[0].shopopen;
        selectedCloseTime!.value = getShopProfileModel.data.data[0].shopclose;
        instagramController.text = getShopProfileModel.data.data[0].instagram;
        facebookController.text = getShopProfileModel.data.data[0].facebook;
        shopImage = getShopProfileModel.data.data[0].showimg;
        offerImage1 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image1;
        offerImage2 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image2;
        offerImage3 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image3;
        offerImage4 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image4;
        offerImage5 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image5;

        meetingImagesList = getShopProfileModel.data.data[0].meetingimages;

        shopApiPicture1 = getShopProfileModel.data.data[0].image1;
        shopApiPicture2 = getShopProfileModel.data.data[0].image2;
        shopApiPicture3 = getShopProfileModel.data.data[0].image3;
        shopApiPicture4 = getShopProfileModel.data.data[0].image4;
        shopApiPicture5 = getShopProfileModel.data.data[0].image5;

        showStatus = getShopProfileModel.data.showstatus.obs;
        log('offerImage1: $offerImage1');

        // shopApiProfile
        if(getShopProfileModel.data.data[0].showimg != "") {
          List<String> profileSplitImageList = getShopProfileModel.data.data[0]
              .showimg.split('/');
          for (int i = 0; i < profileSplitImageList.length; i++) {
            log("profileSplitImageList : ${profileSplitImageList[i]}");
          }
          shopApiProfile = profileSplitImageList[3];
        }

        await userPreference.setUserDetails(
          selfId: UserDetails.selfId,
          userId: UserDetails.selfId,
          userName: getShopProfileModel.data.data[0].shopename,
          userEmail: getShopProfileModel.data.data[0].email,
          userProfileImage: ApiUrl.apiImagePath + getShopProfileModel.data.data[0].showimg,
          token: "",
          roleId: UserDetails.categoryId,
          shopName: getShopProfileModel.data.data[0].shopename,
          shopProfile: getShopProfileModel.data.data[0].showimg,
        );

        if(profileChangeOption == ProfileChangeOption.back) {
          Get.back();
        }


        //
        log('Phone: ${contactNumber.text}');
      } else {
        log("Get All Shop Profile Api Else");
      }

    } catch(e) {
      log("All Shop Profile Api Error ::: $e");
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

  /// Update Shop profile
  updateShopProfileFunction() async {
    isLoading(true);

    // birthDate = day + "-" + month + "-" + year;
    // log('birthDate: $birthDate');

    String url = ApiUrl.shopUpdateProfileApi;
    log("Update Shop Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    // List<String> offerImages = [
    //   shopOfferFile1!.path,
    //   shopOfferFile2!.path,
    //   shopOfferFile3!.path,
    //   shopOfferFile4!.path,
    //   shopOfferFile5!.path
    // ];

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(header);

      // Profile Image
      if (imageFile != null) {
        var stream = http.ByteStream(imageFile!.openRead());
        stream.cast();
        var length = await imageFile!.length();
        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        var multiPart = http.MultipartFile('showimg', stream, length);
        request.files.add(multiPart);
      } else if (imageFile == null) {
        request.fields['oldshowimg'] = shopApiProfile;
      }

      // For File 1
      if (shopOfferFile1 != null) {
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        stream1.cast();
        var length1 = await shopOfferFile1!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        var multiPart1 = http.MultipartFile('image1', stream1, length1);
        request.files.add(multiPart1);
      }  else if (shopOfferFile1 == null) {
        request.fields['oldimage1'] = shopApiPicture1;
      }

      // For File 2
      if (shopOfferFile2 != null) {
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        stream2.cast();
        var length2 = await shopOfferFile2!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        var multiPart2 = http.MultipartFile('image2', stream2, length2);
        request.files.add(multiPart2);
      }  else if (shopOfferFile2 == null) {
        request.fields['oldimage2'] = shopApiPicture2;
      }

      // For File 3
      if (shopOfferFile3 != null) {
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        stream3.cast();
        var length3 = await shopOfferFile3!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        var multiPart3 = http.MultipartFile('image3', stream3, length3);
        request.files.add(multiPart3);
      }  else if (shopOfferFile3 == null) {
        request.fields['oldimage3'] = shopApiPicture3;
      }

      // For File 4
      if (shopOfferFile4 != null) {
        var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        stream4.cast();
        var length4 = await shopOfferFile4!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        var multiPart4 = http.MultipartFile('image4', stream4, length4);
        request.files.add(multiPart4);
      }  else if (shopOfferFile4 == null) {
        request.fields['oldimage4'] = shopApiPicture4;
      }

      // For File 5
      if (shopOfferFile5 != null) {
        var stream5 = http.ByteStream(shopOfferFile5!.openRead());
        stream5.cast();
        var length5 = await shopOfferFile5!.length();
        request.files.add(
            await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));
        var multiPart5 = http.MultipartFile('image5', stream5, length5);
        request.files.add(multiPart5);
      }  else if (shopOfferFile5 == null) {
        request.fields['oldimage5'] = shopApiPicture5;
      }

      //request.fields['name'] = nameController.text.trim();
      request.fields['address'] = addressController.text.trim();
      request.fields['phonenumber'] = contactNumber.text.trim();
      request.fields['shopopen'] = selectedOpenTime!.value;
      request.fields['shopclose'] = selectedCloseTime!.value;
      request.fields['userid'] = UserDetails.userId;
      request.fields['uid'] = UserDetails.selfId;
      request.fields['full_text'] = detailsController.text.trim();
      request.fields['instagram'] = instagramController.text.trim();
      request.fields['facebook'] = facebookController.text.trim();

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value: $value');
        ShopUpdateProfileModel shopProfileModel =
        ShopUpdateProfileModel.fromJson(json.decode(value));
        log('response1 :::::: ${shopProfileModel.success}');
        isSuccessStatus = shopProfileModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: shopProfileModel.message);
          await getAllRoleProfileFunction(profileChangeOption: ProfileChangeOption.back);
        } else {
          log('False False');
        }
      });
      /*if (imageFile != null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 != null && shopOfferFile5 != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream5.cast();

        var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        var length3 = await shopOfferFile3!.length();
        var length4 = await shopOfferFile4!.length();
        var length5 = await shopOfferFile4!.length();

        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

       // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        var multiPart = http.MultipartFile(
          'showimg',
          stream,
          length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile != null && shopOfferFile1 == null && shopOfferFile2 == null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        // var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        // var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        // var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        stream.cast();
        // stream1.cast();
        // stream2.cast();
        // stream3.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        // var length1 = await shopOfferFile1!.length();
        // var length2 = await shopOfferFile2!.length();
        // var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        // request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        // request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        var multiPart = http.MultipartFile(
          'showimg',
          stream,
          length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile != null && shopOfferFile1 != null && shopOfferFile2 == null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        // var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        // var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        stream.cast();
         stream1.cast();
        // stream2.cast();
        // stream3.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        // var length2 = await shopOfferFile2!.length();
        // var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        // request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        var multiPart = http.MultipartFile(
          'showimg',
          stream,
          length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile != null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        // var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        // stream3.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        // var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        var multiPart = http.MultipartFile(
          'showimg',
          stream,
          length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile != null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        // stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        var multiPart = http.MultipartFile(
          'showimg',
          stream,
          length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile != null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 != null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        // stream5.cast();

        var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        var length3 = await shopOfferFile3!.length();
        var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        var multiPart = http.MultipartFile(
          'showimg',
          stream,
          length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile == null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 != null && shopOfferFile5 != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        //stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        var length3 = await shopOfferFile3!.length();
        var length4 = await shopOfferFile4!.length();
        var length5 = await shopOfferFile4!.length();

        //request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        // var multiPart = http.MultipartFile(
        //   'showimg',
        //   stream,
        //   length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile == null && shopOfferFile1 != null && shopOfferFile2 == null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        // var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        // var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        //stream.cast();
        stream1.cast();
        // stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        // var length2 = await shopOfferFile2!.length();
        // var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        //request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        // request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        // var multiPart = http.MultipartFile(
        //   'showimg',
        //   stream,
        //   length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile == null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        // var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        //stream.cast();
        stream1.cast();
         stream2.cast();
        // stream3.cast();
        // stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        // var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        //request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        // request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        // var multiPart = http.MultipartFile(
        //   'showimg',
        //   stream,
        //   length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile == null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 == null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        // var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        //stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        // stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        var length3 = await shopOfferFile3!.length();
        // var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        //request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        // request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        // var multiPart = http.MultipartFile(
        //   'showimg',
        //   stream,
        //   length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile == null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 != null && shopOfferFile5 == null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(shopOfferFile1!.openRead());
        var stream2 = http.ByteStream(shopOfferFile2!.openRead());
        var stream3 = http.ByteStream(shopOfferFile3!.openRead());
        var stream4 = http.ByteStream(shopOfferFile4!.openRead());
        // var stream5 = http.ByteStream(shopOfferFile5!.openRead());

        //stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        // stream5.cast();

        //var length = await imageFile!.length();
        var length1 = await shopOfferFile1!.length();
        var length2 = await shopOfferFile2!.length();
        var length3 = await shopOfferFile3!.length();
        var length4 = await shopOfferFile4!.length();
        // var length5 = await shopOfferFile4!.length();

        //request.files.add(await http.MultipartFile.fromPath("showimg", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", shopOfferFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", shopOfferFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", shopOfferFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", shopOfferFile4!.path));
        // request.files.add(await http.MultipartFile.fromPath("image5", shopOfferFile5!.path));

        // request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

        // var multiPart = http.MultipartFile(
        //   'showimg',
        //   stream,
        //   length,
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
          log('value: $value');
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      else if (imageFile == null && shopOfferFile1 == null && shopOfferFile2 == null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null){
        print("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(header);

        request.fields['shopename'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phonenumber'] = contactNumber.text.trim();
        request.fields['shopopen'] = selectedOpenTime!.value;
        request.fields['shopclose'] = selectedCloseTime!.value;
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = detailsController.text.trim();
        request.fields['instagram'] = instagramController.text.trim();
        request.fields['facebook'] = facebookController.text.trim();

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
          ShopUpdateProfileModel shopProfileModel =
          ShopUpdateProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${shopProfileModel.success}');
          isSuccessStatus = shopProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: shopProfileModel.message);
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
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

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

  /*Future<void> userLoginFunction({required String email, required categoryId}) async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('Login Api Url : $url');

    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": passwordController.text.trim(),
        "categoryID": categoryId,
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

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': 200 * 100,
      'name': nameController.text,
      'description': detailsController.text,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': contactNumber.text, 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    log('options: $options');

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    log('Success Response: ${response.orderId}');
    /*await petAddOrderFunction(
        orderId: response.orderId,
        paymentId: response.paymentId!,
        signature: response.signature
    );*/

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
    log(response.message.toString());
    log(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getAllRoleProfileFunction();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }
}

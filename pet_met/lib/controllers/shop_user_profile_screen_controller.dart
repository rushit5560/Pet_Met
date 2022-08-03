import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/shop_update_profile_model/shop_update_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/user_details.dart';
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

  RxString selectedGenderValue = "Male".obs;
  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var contactNumber = TextEditingController();
  var addressController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String birthDate = "";
  String month= "";
  String day = "";
  String year = "";



  ApiHeader apiHeader = ApiHeader();

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": "${UserDetails.userId}",
        //"uid": "${UserDetails.selfId}",
        "categoryID": "${UserDetails.categoryId}",
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
        nameController.text = getShopProfileModel.data.data[0].shopename;
        contactNumber.text = getShopProfileModel.data.data[0].phonenumber.toString();
        addressController.text = getShopProfileModel.data.data[0].address;
        openTimeController.text = getShopProfileModel.data.data[0].shopopen;
        closeTimeController.text = getShopProfileModel.data.data[0].shopclose;
        shopImage = getShopProfileModel.data.data[0].showimg;
        offerImage1 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image1;
        offerImage2 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image2;
        offerImage3 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image3;
        offerImage4 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image4;
        offerImage5 = ApiUrl.apiImagePath + "asset/uploads/product/" + getShopProfileModel.data.data[0].image5;


        //
        log('Phone: ${contactNumber.text}');
      } else {
        log("Get All Role Profile Api Else");
      }

    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Update Shop profile
  updateShopProfileFunction() async {
    isLoading(true);

    birthDate = day + "-" + month + "-" + year;
    log('birthDate: $birthDate');

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
      if (imageFile != null && shopOfferFile1 != null && shopOfferFile2 != null && shopOfferFile3 != null && shopOfferFile4 != null && shopOfferFile5 != null) {
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
        request.fields['shopopen'] = openTimeController.text.trim();
        request.fields['shopclose'] = closeTimeController.text.trim();
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = "jgjadg";

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
      } else if (imageFile == null && shopOfferFile1 == null && shopOfferFile2 == null && shopOfferFile3 == null && shopOfferFile4 == null && shopOfferFile5 == null){
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
        request.fields['shopopen'] = openTimeController.text.trim();
        request.fields['shopclose'] = closeTimeController.text.trim();
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
        request.fields['full_text'] = "jgjadg";

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
      }
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
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getAllRoleProfileFunction();
  }
}

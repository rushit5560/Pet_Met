import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_get_profile_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_update_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;

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
  RxString selectedGenderValue = "Male".obs;

  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var contactNumber = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();
  var activeController = TextEditingController();
  // var closeTimeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    //birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": "${UserDetails.userId}",
        //"uid": "${UserDetails.userId}",
        "categoryID": "${UserDetails.categoryId}",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      //log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, /*headers: header*/);
      log("Get All Role Profile Api response : ${response.body}");

      GetTrainersProfileModel getTrainersProfileModel =
      GetTrainersProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getTrainersProfileModel.success.obs;

      if (isSuccessStatus.value) {
        nameController.text = getTrainersProfileModel.data.data[0].name;
        contactNumber.text = getTrainersProfileModel.data.data[0].phone;
        addressController.text = getTrainersProfileModel.data.data[0].address;
        detailsController.text = getTrainersProfileModel.data.data[0].fullText;
        trainersProfile = getTrainersProfileModel.data.data[0].image;
        activeController.text = getTrainersProfileModel.data.data[0].isActive;
        openTimeController.text = getTrainersProfileModel.data.data[0].open;
        closeTimeController.text = getTrainersProfileModel.data.data[0].close;

        trainerImage1 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image1;
        trainerImage2 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image2;
        trainerImage3 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image3;
        trainerImage4 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image4;
        trainerImage5 = ApiUrl.apiImagePath + "asset/uploads/product/" + getTrainersProfileModel.data.data[0].image5;
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

  /// Update Vet & NGO profile
  updateTrainersProfileFunction() async {
    isLoading(true);

    //birthDate = day + "-" + month + "-" + year;
    //log('birthDate: $birthDate');

    String url = ApiUrl.trainersUpdateProfileApi;
    log("Update Trainers Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      if (imageFile != null && trainerPictureFile1 != null && trainerPictureFile2 != null && trainerPictureFile3 != null && trainerPictureFile4 != null && trainerPictureFile5 != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        var stream1 = http.ByteStream(trainerPictureFile1!.openRead());
        var stream2 = http.ByteStream(trainerPictureFile2!.openRead());
        var stream3 = http.ByteStream(trainerPictureFile3!.openRead());
        var stream4 = http.ByteStream(trainerPictureFile4!.openRead());
        var stream5 = http.ByteStream(trainerPictureFile5!.openRead());

        stream.cast();
        stream1.cast();
        stream2.cast();
        stream3.cast();
        stream4.cast();
        stream5.cast();

        var length = await imageFile!.length();
        var length1 = await trainerPictureFile1!.length();
        var length2 = await trainerPictureFile2!.length();
        var length3 = await trainerPictureFile3!.length();
        var length4 = await trainerPictureFile4!.length();
        var length5 = await trainerPictureFile5!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.files.add(await http.MultipartFile.fromPath("image1", trainerPictureFile1!.path));
        request.files.add(await http.MultipartFile.fromPath("image2", trainerPictureFile2!.path));
        request.files.add(await http.MultipartFile.fromPath("image3", trainerPictureFile3!.path));
        request.files.add(await http.MultipartFile.fromPath("image4", trainerPictureFile4!.path));
        request.files.add(await http.MultipartFile.fromPath("image5", trainerPictureFile5!.path));
        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactNumber.text.trim();
        request.fields['open'] = openTimeController.text.trim();
        request.fields['close'] = closeTimeController.text.trim();
        request.fields['full_text'] = detailsController.text.trim();
        // request.fields['instagram'] = instagramController.text.trim();
        // request.fields['facebook'] = facebookController.text.trim();
         request.fields['is_active'] = activeController.text.trim();
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
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
          UpdateTrainersProfileModel updateTrainersProfileModel =
          UpdateTrainersProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateTrainersProfileModel.success}');
          isSuccessStatus = updateTrainersProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateTrainersProfileModel.message);
            await getAllRoleProfileFunction();
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      } else if (imageFile == null && trainerPictureFile1 == null && trainerPictureFile2 == null && trainerPictureFile3 == null && trainerPictureFile4 == null && trainerPictureFile5 == null){
        print("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['address'] = addressController.text.trim();
        request.fields['phone'] = contactNumber.text.trim();
        request.fields['open'] = openTimeController.text.trim();
        request.fields['close'] = closeTimeController.text.trim();
        request.fields['full_text'] = detailsController.text.trim();
        // request.fields['instagram'] = instagramController.text.trim();
        // request.fields['facebook'] = facebookController.text.trim();
        request.fields['is_active'] = activeController.text.trim();
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['uid'] = "${UserDetails.userId}";
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
          UpdateTrainersProfileModel updateTrainersProfileModel =
          UpdateTrainersProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateTrainersProfileModel.success}');
          isSuccessStatus = updateTrainersProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateTrainersProfileModel.message);
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
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getAllRoleProfileFunction();
  }
}

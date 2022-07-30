import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/utils/api_url.dart';

class PetVetsAndNgoDetailsScreenController extends GetxController {
  int vetAndNgoId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  VetNgoData vetsNgoDetailsData = VetNgoData();

  Future<void> getVetAndNgoDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllVetAndNgoDetailsApi + "/$vetAndNgoId";

    log("Vet And Ngo Details Api Url : $url");
    log("Vet And Ngo id : $vetAndNgoId");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Vet Details Api Response : ${response.body}");
      VetsAndNgoDetailsModel vetsNgoDetailsModel =
          VetsAndNgoDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = vetsNgoDetailsModel.success!.obs;

      if (isSuccessStatus.value) {
        vetsNgoDetailsData = vetsNgoDetailsModel.data!.first;
        log("vets Details image list  : ${vetsNgoDetailsData.imageList}");
      } else {
        log("Vet Details Api Else Else");
      }
    } catch (e) {
      log("Vet And Ngo Details Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getVetAndNgoDetailsFunction();

    print(" vets id is : $vetAndNgoId");
    super.onInit();
  }
}

class VetsAndNgoDetailsModel {
  bool? success;
  List<VetNgoData>? data;
  String? message;

  VetsAndNgoDetailsModel({this.success, this.data, this.message});

  VetsAndNgoDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <VetNgoData>[];
      json['data'].forEach((v) {
        data!.add(new VetNgoData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class VetNgoData {
  int? id;
  String? name;
  String? imageList;
  String? showimg;
  int? contact;
  String? address;
  String? isActive;
  String? socialMedias;
  String? openTime;
  String? closeTime;
  String? overview;
  int? roleId;
  int? userId;

  VetNgoData(
      {this.id,
      this.name,
      this.imageList,
      this.showimg,
      this.contact,
      this.address,
      this.isActive,
      this.socialMedias,
      this.openTime,
      this.closeTime,
      this.overview,
      this.roleId,
      this.userId});

  VetNgoData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    imageList = json['image_list'] ?? "";
    showimg = json['showimg'] ?? "";
    contact = json['contact'] ?? 0;
    address = json['address'] ?? "";
    isActive = json['is_active'] ?? "";
    socialMedias = json['social_medias'] ?? "";
    openTime = json['open_time'] ?? "";
    closeTime = json['close_time'] ?? "";
    overview = json['overview'] ?? "";
    roleId = json['role_id'] ?? 0;
    userId = json['user_id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_list'] = this.imageList;
    data['showimg'] = this.showimg;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['is_active'] = this.isActive;
    data['social_medias'] = this.socialMedias;
    data['open_time'] = this.openTime;
    data['close_time'] = this.closeTime;
    data['overview'] = this.overview;
    data['role_id'] = this.roleId;
    data['user_id'] = this.userId;
    return data;
  }
}

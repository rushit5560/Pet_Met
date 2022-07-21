import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pet_met/utils/app_route_names.dart';

import '../utils/api_url.dart';

class PetTrackerPricingController extends GetxController {
  final size = Get.size;

  int petPlanId = Get.arguments;

  TextEditingController feedbackController = TextEditingController();

  RxBool selectedTerms = false.obs;

  final formKey = GlobalKey<FormState>();

  List<PetTrackerModel> petTrackerList = [
    PetTrackerModel(
      price: 150,
      planType: "basic",
      planDetails: "With tens of thousands of satisfied clients",
    ),
    PetTrackerModel(
      price: 999,
      planType: "premium",
      planDetails: "With tens of thousands of satisfied clients",
    ),
  ];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  SinglePlanDetails planDetailsData = SinglePlanDetails();

  Future<void> getplanDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getPlanDetailsApi + "/$petPlanId";

    log("pet plan Details Api Url : $url");
    log("pet plan id : $petPlanId");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Vet Details Api Response : ${response.body}");
      SinglePlanDetailModel vetsNgoDetailsModel =
          SinglePlanDetailModel.fromJson(json.decode(response.body));
      isSuccessStatus = vetsNgoDetailsModel.success!.obs;

      if (isSuccessStatus.value) {
        planDetailsData = vetsNgoDetailsModel.data!.first;
        log("plan Details overview  : ${planDetailsData.overview}");
      } else {
        log("plan Details  Api Else Else");
      }
    } catch (e) {
      log("plan Details  Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getplanDetailsFunction();
    super.onInit();
  }
}

class PetTrackerModel {
  final int? price;
  final String? planType;
  final String? planDetails;

  PetTrackerModel({
    this.price,
    this.planType,
    this.planDetails,
  });
}

class SinglePlanDetailModel {
  bool? success;
  List<SinglePlanDetails>? data;
  String? message;

  SinglePlanDetailModel({this.success, this.data, this.message});

  SinglePlanDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <SinglePlanDetails>[];
      json['data'].forEach((v) {
        data!.add(new SinglePlanDetails.fromJson(v));
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

class SinglePlanDetails {
  int? id;
  int? rs;
  String? name;
  String? overview;
  String? isActive;
  int? days;

  SinglePlanDetails(
      {this.id, this.rs, this.name, this.overview, this.isActive, this.days});

  SinglePlanDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rs = json['rs'];
    name = json['name'];
    overview = json['overview'];
    isActive = json['is_active'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rs'] = this.rs;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['is_active'] = this.isActive;
    data['days'] = this.days;
    return data;
  }
}

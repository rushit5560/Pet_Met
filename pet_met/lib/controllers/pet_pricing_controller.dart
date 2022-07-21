import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/app_route_names.dart';

class PetPricingController extends GetxController {
  final size = Get.size;

  TextEditingController feedbackController = TextEditingController();

  RxBool selectedTerms = false.obs;

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

  List<PlanData> planData = [
    PlanData(),
  ];

  AllPlanListModel plansList = AllPlanListModel();

  Future<void> getAllPlansListFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPlanApi;

    log("get all plan Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("get all plan Api Response : ${response.body}");
      AllPlanListModel planListModel =
          AllPlanListModel.fromJson(json.decode(response.body));
      isSuccessStatus = planListModel.success!.obs;

      if (isSuccessStatus.value) {
        planData = planListModel.data!;
        log("get all plan name  : ${planData.first.name}");
        log("get all plan overview  : ${planData.first.overview}");
      } else {
        log("get all plan Api Else Else");
      }
    } catch (e) {
      log("get all plan Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllPlansListFunction();
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

class AllPlanListModel {
  bool? success;
  List<PlanData>? data;
  String? message;

  AllPlanListModel({this.success, this.data, this.message});

  AllPlanListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PlanData>[];
      json['data'].forEach((v) {
        data!.add(new PlanData.fromJson(v));
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

class PlanData {
  int? id;
  int? rs;
  String? name;
  String? overview;
  String? isActive;
  int? days;

  PlanData(
      {this.id, this.rs, this.name, this.overview, this.isActive, this.days});

  PlanData.fromJson(Map<String, dynamic> json) {
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

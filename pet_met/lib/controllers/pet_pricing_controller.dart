import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/get_all_plan_list_model/get_all_plan_list_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';

class PetPricingController extends GetxController {
  final size = Get.size;

  TextEditingController feedbackController = TextEditingController();

  RxBool selectedTerms = false.obs;

  // List<PetTrackerModel> petTrackerList = [
  //   PetTrackerModel(
  //     price: 150,
  //     planType: "basic",
  //     planDetails: "With tens of thousands of satisfied clients",
  //   ),
  //   PetTrackerModel(
  //     price: 999,
  //     planType: "premium",
  //     planDetails: "With tens of thousands of satisfied clients",
  //   ),
  // ];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<PlanData> planData = [];
  RxBool status = false.obs;
 // AllPlanListModel plansList = AllPlanListModel();

  Future<void> getAllPlansListFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPlanApi;

    log("get all plan Api Url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "id": UserDetails.selfId,
        "categoryID" : UserDetails.categoryId,
      };
      log("bodyData : $bodyData");

      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(Uri.parse(url), headers: header, body: bodyData);
      log("get all plan Api Response : ${response.body}");
      AllPlanListModel planListModel =
          AllPlanListModel.fromJson(json.decode(response.body));
      isSuccessStatus = planListModel.success.obs;

      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        planData = planListModel.date;
        status = planListModel.status.obs;
        log('status: $status');
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

/*class PetTrackerModel {
  final int? price;
  final String? planType;
  final String? planDetails;

  PetTrackerModel({
    this.price,
    this.planType,
    this.planDetails,
  });
}*/



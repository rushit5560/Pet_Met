import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() {
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

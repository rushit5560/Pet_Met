import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';




class PetTrainersScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  ApiHeader apiHeader = ApiHeader();
  final formKey = GlobalKey<FormState>();
  TextEditingController searchFieldController = TextEditingController();

  List<Trainers> trainersList = [];
  List<Trainers> searchTrainersList = [];

  // Get All Trainers
  Future<void> getAllTrainerFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllTrainerApi;
    log("Get All Trainers Api Url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "latitude": UserDetails.liveLatitude,
        "longitude": UserDetails.liveLongitude
      };

      Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.post(
          Uri.parse(url),
          headers: header,
        body: bodyData,
      );
      // log("Get All Trainer Response : ${response.body}");

      AllTrainerModel allTrainerModel =
          AllTrainerModel.fromJson(json.decode(response.body));
      isSuccessStatus = allTrainerModel.success.obs;

      if (isSuccessStatus.value) {
        trainersList.clear();
        trainersList.addAll(allTrainerModel.data);
        searchTrainersList.clear();
        searchTrainersList.addAll(allTrainerModel.data);
        log("trainersList Length : ${trainersList.length}");
      } else {
        log("Get All Trainer Api Else");
      }
    } catch (e) {
      log("Get All Trainers Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  List<String> petTrainersList = [
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name",
    "Trainers company name"
  ];

  @override
  void onInit() {
    getAllTrainerFunction();
    super.onInit();
  }
}

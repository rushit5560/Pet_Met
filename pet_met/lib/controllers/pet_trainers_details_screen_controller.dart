import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/pet_trainers_details_screen_models/trainer_details_model.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;

class PetTrainersDetailsScreenController extends GetxController {
  // Get Trainer Id From Trainer List Screen
  String trainerId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  TrainerData trainerDetails = TrainerData();

  Future<void> getTrainerDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getTrainerDetailsApi + "/$trainerId";
    log("Trainer Details Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);

      TrainerDetailsModel trainerDetailsModel =
          TrainerDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = trainerDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        trainerDetails = trainerDetailsModel.data[0];
      } else {
        log("Trainer Details Api Else");
      }
    } catch (e) {
      log("Trainer Details Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getTrainerDetailsFunction();
    super.onInit();
  }
}

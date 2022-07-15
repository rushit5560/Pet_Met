import 'package:get/get.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';

class PetTrainersDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  Trainers trainerDetails = Get.arguments;
}
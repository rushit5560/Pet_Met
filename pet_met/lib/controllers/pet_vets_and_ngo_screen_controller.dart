import 'package:get/get.dart';

class  PetVetsAndNgoScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;


  List<String> vetsAndNgoList = [
    "Ngo Name",
    "Ngo Name 1",
    "Ngo Name 2",
    "Ngo Name 3",
    "Ngo Name 4",
    "Ngo Name 5",
    "Ngo Name 6",
    "Ngo Name 7",
    "Ngo Name 8",
    "Ngo Name 9"
  ];
}
import 'package:get/get.dart';

class ShopAndGroomingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;


  List<String> shopList = [
    "Skylos The Pet Shop",
    "The Muster Pet Zone",
    "One Stop Pet Shop",
    "Dog Club Pet",
    "Dogclub pet Shop",
    "Skylos The Pet Shop",
    "The Muster Pet Zone",
    "One Stop Pet Shop",
    "Dog Club Pet",
    "Dogclub pet Shop"
  ];
}
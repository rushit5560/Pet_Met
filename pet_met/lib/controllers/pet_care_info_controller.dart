import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:http/http.dart' as http;

import '../models/pet_care_info_screen_models/pet_care_model.dart';

class PetCareInfoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  String title = "";
  String description = "";

  var drawerController = ZoomDrawerController();

  Future<void> getPetCareFunction() async {
    isLoading(true);
    String url = ApiUrl.petCareApi;
    log("Api Url Pet Care Api Url : $url");

    try {
       Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Privacy Policy api Response : ${response.body}");

      PetCareModel petCareModel =
          PetCareModel.fromJson(json.decode(response.body));
      isSuccessStatus = petCareModel.success.obs;

      if (isSuccessStatus.value) {
        title = petCareModel.data[0].title;
        description = petCareModel.data[0].content;
      } else {
        log("Privacy Policy Function Else");
      }
    } catch (e) {
      log("Privacy policy api error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  List<PetCareInfoModel> petCareInfosList = [
    PetCareInfoModel(
      name: "Meet Your Sitter Before You Schedule",
      description:
          "We believe that you and your pet should feel as comfortable as possible with your sitter before our scheduled service takes place. That’s why we offer a free in-home consultation before your first service begins. This gives everyone a chance to get to know each other and make sure that this is a good fit.",
    ),
    PetCareInfoModel(
      name: "Pet Sitting & Pet Medical Administration",
      description:
          "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. Each of our sitters come with fantastic reviews of their own and our local owners are constantly reviewing feedback surveys to ensure it stays that way.",
    ),
    PetCareInfoModel(
      name: "Consistent Availability, Flexible Scheduling",
      description:
          "Receiving medicine can be an undesirable and sometimes scary experience for a pet. But we can make it a little easier. Our medical administrators are experienced in more than just giving medicine. They take care to make sure your pet feels comfortable and safe throughout the experience. So whether your pet has been recently neutered, diagnosed with an illness, or just needs its monthly heartworm medication, leave it to us to get them their prescribed medication as scheduled.",
    ),
    PetCareInfoModel(
      name: "Experienced, Animal - loving Pet Sitters",
      description:
          "You love your new puppy with all your heart…but you’re less fond of stained carpets, chewed up shoes, and slobbery clothing. Thankfully, you don’t have to go through the process of transforming your little rascal into a good boy or girl all by yourself. Our local sitters can help you customize the perfect feeding, exercise, and potty schedule for your pup while helping them learn the proper way to behave in your home.",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    getPetCareFunction();
  }
}

class AddressModel {
  final String? title;
  final String? address;
  final bool? isChecked;

  AddressModel({
    this.title,
    this.address,
    this.isChecked,
  });

  // NOTE: implementing functionality here in the next step!
}

class PetCareInfoModel {
  final String? name;
  final String? description;
  PetCareInfoModel({
    this.name,
    this.description,
  });
}

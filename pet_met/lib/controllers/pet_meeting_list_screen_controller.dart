import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/get_all_pet_list_model/get_all_pet_list_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';

class PetMeetingListScreenController extends GetxController {
  String subcategoryId = Get.arguments ?? "0";

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  List<PetDatum> subCatPetList = [];


  Future<void> getCategoryWisePetList() async {
    isLoading(true);
    String url = ApiUrl.subCategoryWisePetsApi;
    log("url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "id": subcategoryId,
        "latitude": UserDetails.liveLatitude,
        "longitude": UserDetails.liveLongitude
      };


      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      GetPetTopListModel subcategoryWisePetModel = GetPetTopListModel.fromJson(json.decode(response.body));
       isSuccessStatus = subcategoryWisePetModel.success.obs;

      if(isSuccessStatus.value) {
        subCatPetList.clear();
        subCatPetList.addAll(subcategoryWisePetModel.data);

      } else {
        log("");
      }

    } catch(e) {
      log("getCategoryWisePetList Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    getCategoryWisePetList();
    super.onInit();
  }
}

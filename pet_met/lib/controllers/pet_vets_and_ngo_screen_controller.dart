import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/pet_vets_and_ngo_screen_models.dart';
import 'package:pet_met/utils/api_url.dart';

class  PetVetsAndNgoScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  List<VetAndNgoData> vetAndNgoList = [];

  Future<void> getAllVetAndNgoFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllVetAndNgoApi;
    log("Vet And Ngo Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Vet And Ngo List Response : ${response.body}");

      AllVetAndNgoModel allVetAndNgoModel = AllVetAndNgoModel.fromJson(json.decode(response.body));
      isSuccessStatus = allVetAndNgoModel.success.obs;

      if(isSuccessStatus.value) {
        vetAndNgoList.clear();
        vetAndNgoList.addAll(allVetAndNgoModel.data);
        log('vetAndNgoList Length : ${vetAndNgoList.length}');
      } else {
        log('Vet And Ngo Api Else Else');
      }


    } catch(e) {
      log("Vet And Ngo Function Error : $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    getAllVetAndNgoFunction();
    super.onInit();
  }
}
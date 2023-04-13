import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/term_and_condition_models/term_and_condition_model.dart';
import '../utils/api_url.dart';

class TermAndConditionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString description = "".obs;


  Future<void> getPrivacyPolicyFunction() async {
    isLoading(true);
    String url = ApiUrl.termAndConditionApi;
    log("Api Url Privacy Policy : $url");

    try {

      http.Response response = await http.get(
        Uri.parse(url), /*headers: header*/
      );
      log("Privacy Policy api Response : ${response.body}");

      TermAndConditionModel termAndConditionModel =
      TermAndConditionModel.fromJson(json.decode(response.body));
      isSuccessStatus = termAndConditionModel.success.obs;

      if (isSuccessStatus.value) {
        // title = privacyPolicyModel.data[0].title;
        description = termAndConditionModel.data[0].content.obs;
        log("description : $description");
      } else {
        log("Privacy Policy Function Else");
      }
    } catch (e) {
      log("Privacy policy api error ::: $e");
    }
    isLoading(false);
  }

  @override
  void onInit() {
    getPrivacyPolicyFunction();
    super.onInit();
  }

}
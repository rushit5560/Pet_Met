import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/privacy_policy_screen_models/privacy_policy_model.dart';
import 'package:pet_met/utils/api_url.dart';


class PrivacyPolicyScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  String title = "";
  String description = "";

  Future<void> getPrivacyPolicyFunction() async {
    isLoading(true);
    String url = ApiUrl.privacyPolicyApi;
    log("Api Url Privacy Policy : $url");

    try {
      // Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.get(
        Uri.parse(url), /*headers: header*/
      );
      log("Privacy Policy api Response : ${response.body}");

      PrivacyPolicyModel privacyPolicyModel =
          PrivacyPolicyModel.fromJson(json.decode(response.body));
      isSuccessStatus = privacyPolicyModel.success.obs;

      if (isSuccessStatus.value) {
        title = privacyPolicyModel.data[0].title;
        description = privacyPolicyModel.data[0].content;
        log("description : $description");
      } else {
        log("Privacy Policy Function Else");
      }
    } catch (e) {
      log("Privacy policy api error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getPrivacyPolicyFunction();
    super.onInit();
  }
}

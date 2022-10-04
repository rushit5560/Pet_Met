import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/about_screen_models/about_us_model.dart';
import 'package:pet_met/utils/api_url.dart';

class AboutController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  // RxBool slectedAddress = true.obs;

  String title = "";
  String description = "";

  var drawerController = ZoomDrawerController();

  Future<void> getAboutUsFunction() async {
    isLoading(true);
    String url = ApiUrl.aboutApi;
    log("About us Api Url : $url");

    try {
      // Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.get(
        Uri.parse(url), /*headers: header*/
      );
      log("Privacy Policy api Response : ${response.body}");

      AboutUsModel aboutUsModel =
          AboutUsModel.fromJson(json.decode(response.body));
      isSuccessStatus = aboutUsModel.success.obs;

      if (isSuccessStatus.value) {
        title = aboutUsModel.data[0].title;
        description = aboutUsModel.data[0].content;
      } else {
        log("Privacy Policy Function Else");
      }
    } catch (e) {
      log("Privacy policy api error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // List<AddressModel> addressList = [
  //   AddressModel(
  //     title: "Honduras",
  //     address: "1691 Vetug Boulevard",
  //     isChecked: true,
  //   ),
  //   AddressModel(
  //     title: "Mavlohige",
  //     address: "272 Wecdo Heights",
  //     isChecked: false,
  //   ),
  // ];

  @override
  void onInit() {
    super.onInit();
    getAboutUsFunction();
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

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/models/faq_screen_models/faq_model.dart';
import 'package:pet_met/utils/api_url.dart';

class FaqController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<FaqData> faqList = [];

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  var drawerController = ZoomDrawerController();

  Future<void> getFaqFunction() async {
    isLoading(true);
    String url = ApiUrl.faqApi;
    log("Faq Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Support Api Response : ${response.body}");

      FaqModel faqModel = FaqModel.fromJson(json.decode(response.body));
      isSuccessStatus = faqModel.success.obs;

      if (isSuccessStatus.value) {
        faqList.clear();
        faqList.addAll(faqModel.data);
        log('faqList : ${faqList.length}');
      } else {
        log("faqList Function Else");
      }
    } catch (e) {
      log("faqList Function Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  List questionsList = [
    "How They Work, and Why They’re Important",
    "What are the costs and benefits of pet microchips",
    "ind out the details and why you should consider getting one for your dog.",
    "What’s the best thing you can do for your cat who might wander off?",
    "How Does a Pet Microchip Work?",
    "Do I Need a Microchip?",
    "The needle is a little bigger, but the pain is minimal and the process is usually quick.",
    "Anesthesia is not needed, so this can be done at your vet’s office.",
  ];

  @override
  void onInit() {
    super.onInit();
    getFaqFunction();
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

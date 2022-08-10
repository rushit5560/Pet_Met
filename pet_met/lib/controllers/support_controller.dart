import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/support_screen_models/support_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;

class SupportController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;
  ApiHeader apiHeader = ApiHeader();
  //SupportData supportData = SupportData();
  List<SupportData> supportData = [];

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  String featuredImage = "";
  String title = "";
  String content = "";

  var drawerController = ZoomDrawerController();

  Future<void> getSupportFunction() async {
    isLoading(true);
    String url = ApiUrl.supportApi;
    log("Support Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Support Api Response : ${response.body}");

      SupportModel supportModel =
          SupportModel.fromJson(json.decode(response.body));
      isSuccessStatus = supportModel.success.obs;

      if (isSuccessStatus.value) {
        supportData = supportModel.data;
        for(int i=0 ; i< supportData.length; i++){
          featuredImage = supportData[i].featuredimageparth!;
          title = supportData[i].title!;
          content = supportData[i].content!;
        }
        log("supportData : $supportData");
      } else {
        log("Support Function Else");
      }
    } catch (e) {
      log("Support Function Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  List<AddressModel> addressList = [
    AddressModel(
      title: "Honduras",
      address: "1691 Vetug Boulevard",
      isChecked: true,
    ),
    AddressModel(
      title: "Mavlohige",
      address: "272 Wecdo Heights",
      isChecked: false,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    getSupportFunction();
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

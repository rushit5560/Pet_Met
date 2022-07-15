import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/home_screen_models/banner_model.dart';
import 'package:pet_met/utils/api_url.dart';


class HomeController extends GetxController {
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;
  List<BannerData> bannerList = [];

  var drawerController = ZoomDrawerController();

  List dogsTopList = [
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
  ];

  // toggleMenu([bool end = false]) {
  //   if (end) {
  //     final _state = endSideMenuKey.currentState!;
  //     if (_state.isOpened) {
  //       _state.closeSideMenu();
  //     } else {
  //       _state.openSideMenu();
  //     }
  //   } else {
  //     final _state = sideMenuKey.currentState!;
  //     if (_state.isOpened) {
  //       _state.closeSideMenu();
  //     } else {
  //       _state.openSideMenu();
  //     }
  //   }
  // }


  /// Get All Banner
  Future<void> getAllBannerFunction() async {
    isLoading(true);
    String url = ApiUrl.bannerApi;
    log("Banner Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Banner Api Response : ${response.body}");

      BannerModel bannerModel = BannerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bannerModel.success.obs;

      if(isSuccessStatus.value) {
        bannerList.clear();
        bannerList.addAll(bannerModel.data);
        log("bannerList Length : ${bannerList.length}");
      } else {
        log("Banner Api Else");
      }


    } catch(e) {
      log("Banner Api Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    super.onInit();
    getAllBannerFunction();
  }
}

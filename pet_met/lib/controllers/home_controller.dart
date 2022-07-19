import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/home_screen_models/banner_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';


class HomeController extends GetxController {
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  RxBool isOpened = false.obs;
  List<BannerData> bannerList = [];



  var drawerController = ZoomDrawerController();

  List dogsTopList = [
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
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

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
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
      // await getAllPetFunction();
    }
  }

  /// Get All Pets
  /*Future<void> getAllPetFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPetApi;
    log("All Pet Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Get All Pet Api response : ${response.body}");



    } catch(e) {
      log("Get All Pet Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }*/

  @override
  void onInit() {
    super.onInit();
    getAllBannerFunction();
  }
}

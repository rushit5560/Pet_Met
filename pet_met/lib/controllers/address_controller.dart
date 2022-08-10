import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/add_address_screen_model/isactive_address_model.dart';
import 'package:pet_met/models/get_all_address_model/get_all_address_model.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';

class AddressController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  var drawerController = ZoomDrawerController();

  ApiHeader apiHeader = ApiHeader();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<Datum> getAllAddressList = [];

  Future<void> getAllAddressFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllAddressApi + "${UserDetails.userId}";
    log('Get All Address Api Url : $url');

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get Address Api Response : ${response.body}");

      GetAllAddressModel getAllAddressModel = GetAllAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAddressModel.success.obs;

      if (isSuccessStatus.value) {
        getAllAddressList = getAllAddressModel.data;
        log('getAllAddressList: $getAllAddressList');
      } else {
      }
    } catch(e) {
      log('User Address Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addressIsActiveFunction(int index) async {
    isLoading(true);
    String url = ApiUrl.setAddressIsActiveApi +
        "${UserDetails.userId}" +
        "/${getAllAddressList[index].id}";
    log('Set active Address Api Url : $url');

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("set Address Api Response : ${response.body}");

      IsActiveAddressModel isActiveAddressModel =
      IsActiveAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus = isActiveAddressModel.success!.obs;

      if (isSuccessStatus.value) {
        // getAllAddressList = getAllAddressModel.data;
        log('is active address call : ${getAllAddressList[0].address}');
      } else {}
    } catch (e) {
      log('User Login Api Error ::: $e');
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
    getAllAddressFunction();
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

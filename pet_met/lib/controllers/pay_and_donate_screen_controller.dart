import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/pay_and_donate_screen_models/donate_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';



class PayAndDonateReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final size = Get.size;

  List<PayAndDonateData> payAndDonateList = [];

  Future<void> getUserPayAndDonateOrderFunction() async {
    isLoading(true);
    String url = ApiUrl.payAndDonateOrderApi;
    log("Meeting Api Url : $url");


    try {
      Map<String, dynamic> bodyData = {
        "userid" : UserDetails.userId,
        "uid" : UserDetails.selfId,
        "categoryID" : UserDetails.categoryId
      };

      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      log("response : ${response.body}");

      DonateModel donateModel = DonateModel.fromJson(json.decode(response.body));
      isSuccessStatus = donateModel.success.obs;

      if(isSuccessStatus.value) {
        payAndDonateList.clear();
        payAndDonateList.addAll(donateModel.date);
        log("meetingOrderList : ${payAndDonateList.length}");
      } else {
        log("getUserMeetingOrderFunction Else");
      }


    } catch(e) {
      log("getUserMeetingOrderFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    getUserPayAndDonateOrderFunction();
    super.onInit();
  }

}
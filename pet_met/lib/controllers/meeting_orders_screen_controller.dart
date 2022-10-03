import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/meeting_orders_screen_models/meeting_orders_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';



class MeetingOrdersScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  List<MeetingOrderDetail> meetingOrderList = [];

  Future<void> getUserMeetingOrderFunction() async {
    isLoading(true);
    String url = ApiUrl.meetingOrderApi;
    log("Meeting Api Url : $url");


    try {
      Map<String, dynamic> bodyData = {
        "userid" : UserDetails.selfId,
        "categoryID" : UserDetails.categoryId
      };

      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      log("response : ${response.body}");

      MeetingOrdersModel meetingOrdersModel = MeetingOrdersModel.fromJson(json.decode(response.body));
      isSuccessStatus = meetingOrdersModel.success.obs;

      if(isSuccessStatus.value) {
        meetingOrderList.clear();
        meetingOrderList.addAll(meetingOrdersModel.date.orderdetails);
        log("meetingOrderList : ${meetingOrderList.length}");
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
    getUserMeetingOrderFunction();
    super.onInit();
  }

}
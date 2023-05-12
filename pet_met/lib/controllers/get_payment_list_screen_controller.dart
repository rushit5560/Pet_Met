import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/active_payment_model/active_payment_model.dart';
import 'package:pet_met/models/get_payment_list_screen_model/get_payment_list_screen_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class GetPaymentListScreenController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool slectedAddress = true.obs;

  ApiHeader apiHeader = ApiHeader();

  List<Datum> paymentList = [];

  /// Get Payment List
  Future<void> getPaymentListFunction() async {
    isLoading(true);
    String url = ApiUrl.getPaymentListApi + UserDetails.userId;
    log("Get Payment List Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Payment List Api Response : ${response.body}");

      GetPaymentListModel getPaymentListModel =
          GetPaymentListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPaymentListModel.success.obs;

      if (isSuccessStatus.value) {
        paymentList.clear();
        paymentList.addAll(getPaymentListModel.data);
        log("paymentList Length : ${paymentList.length}");
      } else {
        log("Get payment List Api Else");
      }
    } catch (e) {
      log("Payment Api Error ::: $e");
    } finally {
      isLoading(false);
      //await getAllPetFunction();
    }
  }

  Future<void> paymentIsActiveFunction(int index) async {
    isLoading(true);
    String url = ApiUrl.setPaymentIsActiveApi +
        UserDetails.userId +
        "/${paymentList[index].id}";
    log('Set active Payment Api Url : $url');

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("set Payment Active Api Response : ${response.body}");

      ActivePaymentModel activePaymentModel =
          ActivePaymentModel.fromJson(json.decode(response.body));
      isSuccessStatus = activePaymentModel.success.obs;

      if (isSuccessStatus.value) {
        // getAllAddressList = getAllAddressModel.data;
        log('is active Payment call : ${paymentList[0].cardName}');
        Fluttertoast.showToast(msg: activePaymentModel.message,fontSize: 12.sp);
      } else {}
    } catch (e) {
      log('Active Payment Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPaymentListFunction();
  }
}

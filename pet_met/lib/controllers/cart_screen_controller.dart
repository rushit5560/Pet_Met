import 'package:get/get.dart';

class CartScreenController extends GetxController {
  RxBool isLoading = false.obs;
RxInt counter=0.obs;
  var total = 0.obs;
  void increment(int price)=>total.value+=price;
  void decrement(int price)=>total.value-=price;
}

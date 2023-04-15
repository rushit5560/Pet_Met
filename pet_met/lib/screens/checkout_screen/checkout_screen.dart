import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/checkout_screen_controller.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);
  final checkOutScreenController = Get.put(CheckOutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

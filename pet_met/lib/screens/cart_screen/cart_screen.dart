import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/cart_screen/cart_screen_widgets.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/cart_screen_controller.dart';
import '../get_payment_list_screen/get_payment_list_screen_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                themeProvider.darkTheme
                    ? AppImages.backgroundImgDark
                    : AppImages.backgroundImgLight,
              ),
            ),
            CartListViwModule(),

          ],
        ),
      ),
    );
  }
}

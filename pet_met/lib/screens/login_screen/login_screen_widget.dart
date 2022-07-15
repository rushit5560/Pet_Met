import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/login_controller.dart';
import 'package:pet_met/utils/app_images.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(AppImages.tealBackgroundImg),
    );
  }
}

class PetMetLogoModule extends StatelessWidget {
  PetMetLogoModule({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: controller.size.height * 0.03,
      left: controller.size.width * 0.1,
      child: Image.asset(
        AppImages.petMetLogoImg,
        width: controller.size.width * 0.25,
      ),
    );
  }
}

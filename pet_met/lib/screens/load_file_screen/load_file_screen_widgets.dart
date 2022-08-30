import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/load_file_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class BackgroundCurve extends StatelessWidget {
  BackgroundCurve({Key? key}) : super(key: key);

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(themeProvider.darkTheme
          ? AppImages.backgroundImgDark
          : AppImages.backgroundImgLight),
    );
  }
}

class LoadFileModule extends StatefulWidget {
  LoadFileModule({Key? key}) : super(key: key);

  @override
  State<LoadFileModule> createState() => _LoadFileModuleState();
}

class _LoadFileModuleState extends State<LoadFileModule> {
  final controller = Get.find<LoadFileController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        takePictureModule(),
        const SizedBox(width: 20),
        folderDisplayModule(),
      ],
    );
  }

  folderDisplayModule() {
    return GestureDetector(
      onTap: getFromGallery,
      child: Container(
        height: controller.size.height * 0.13,
        width: controller.size.height * 0.13,
        // width: 100,
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.galleryImg,
              height: controller.size.height * 0.055,
            ),
          ],
        ),
      ),
    );
  }

  takePictureModule() {
    return GestureDetector(
      onTap: getFromCamera,
      child: Container(
        height: controller.size.height * 0.13,
        width: controller.size.height * 0.13,
        // width: 100,
        decoration: BoxDecoration(
          color: const Color(0xFF15AEAB).withOpacity(0.4),
          border: Border.all(
            color: AppColors.accentTextColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Image.asset(
              AppImages.cameraImg,
              height: controller.size.height * 0.055,
            ),
            const SizedBox(height: 10),
            Text(
              "Take Picture",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }
  }
}

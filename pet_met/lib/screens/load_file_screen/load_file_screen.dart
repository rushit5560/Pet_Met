import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/load_file_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';
import 'load_file_screen_widgets.dart';

class LoadFileScreen extends StatefulWidget {
  LoadFileScreen({Key? key}) : super(key: key);

  @override
  State<LoadFileScreen> createState() => _LoadFileScreenState();
}

class _LoadFileScreenState extends State<LoadFileScreen> {
  final controller = Get.put(LoadFileController());

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // BackGroundLeftShadow(
            //   height: controller.size.height * 0.3,
            //   width: controller.size.height * 0.3,
            //   topPad: controller.size.height * 0.25,
            //   leftPad: -controller.size.width * 0.15,
            // ),
            // BackGroundRightShadow(
            //   height: controller.size.height * 0.3,
            //   width: controller.size.height * 0.3,
            //   topPad: controller.size.height * 0.45,
            //   rightPad: -controller.size.width * 0.15,
            // ),
            BackgroundCurve(),
            Column(
              children: [
                CustomAppBar(
                  title: "Explorer",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 20, left: 20, right: 20, bottom: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Image.asset(
                //           "assets/icons/left_back_arrow.png",
                //           width: controller.size.width * 0.07,
                //         ),
                //       ),
                //       const SizedBox(),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 1.h),
                          LoadFileModule(),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Explorer",
                          //       style: TextStyle(
                          //         color: AppColors.accentTextColor,
                          //         fontSize: 20.sp,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 3.h),
                          // Row(
                          //   children: [
                          //     takePictureModule(),
                          //     const SizedBox(width: 20),
                          //     folderDisplayModule(),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
          color: themeProvider.darkTheme
              ? AppColors.greyColor.withOpacity(0.25)
              : AppColors.whiteColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/folder_yellow.png",
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
              "assets/images/camera_green.png",
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

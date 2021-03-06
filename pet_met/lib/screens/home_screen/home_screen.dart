import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/home_controller.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  final indexController = Get.put(IndexScreenController());

  // final indexController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.25,
              leftPad: -controller.size.width * 0.15,
            ),
            BackGroundRightShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.45,
              rightPad: -controller.size.width * 0.15,
            ),
            Column(
              children: [
                CustomAppBar(
                  title: "User Categories",
                  appBarOption: AppBarOption.drawerButtonOption,
                  isTitleText: false,
                  centerWidget: Image.asset(
                    AppImages.petMetLogoImg,
                    width: controller.size.width * 0.25,
                  ),
                  trailingWidget: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouteNames.userProfileRoute);
                    },
                    child: Image.asset(
                      AppImages.userProfileImg,
                      width: controller.size.width * 0.12,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             indexController.drawerController.open!();
                //           });
                //         },
                //         child: Image.asset(
                //           "assets/icons/drawer_icon.png",
                //           color: AppColors.blackTextColor,
                //           width: controller.size.width * 0.07,
                //         ),
                //       ),
                //       Image.asset(
                //         "assets/images/petmet_logo.png",
                //         width: controller.size.width * 0.25,
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Get.toNamed(AppRouteNames.userProfileRoute);
                //         },
                //         child: Image.asset(
                //           "assets/images/user_ellipse.png",
                //           width: controller.size.width * 0.12,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                PetListModule()
                                    .commonSymmetricPadding(horizontal: 20),
                                SizedBox(
                                  height: controller.size.height * 0.025,
                                ),
                                BannerModule(),
                                const SizedBox(height: 10),
                                PetShopAndGroomingText()
                                    .commonSymmetricPadding(horizontal: 20),

                                /*AllPetsListModule()
                                    .commonSymmetricPadding(horizontal: 20),*/
                              ],
                            ).commonSymmetricPadding(vertical: 20),
                          ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

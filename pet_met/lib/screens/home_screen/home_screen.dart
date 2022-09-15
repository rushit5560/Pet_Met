import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/home_controller.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/controllers/user_profile_controller.dart';
import 'package:pet_met/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:pet_met/screens/ngo_user_profile_screen/ngo_user_profile_screen.dart';
import 'package:pet_met/screens/shop_user_profile_screen/shop_user_profile_screen.dart';
import 'package:pet_met/screens/trainers_and_users_profile_screen/trainers_and_user_profile_screen.dart';
import 'package:pet_met/screens/user_profile_edit_screen/user_profile_edit_screen.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/user_details.dart';
import '../../utils/app_colors.dart';
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

  //final userProfileController = Get.put(UserProfileController());

  // final indexController = Get.find<IndexScreenController>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller.getUserStory();
  // }

  @override
  Widget build(BuildContext context) {
    log('User profile: ${controller.userprofile}');
    // var themeProvider = Provider.of<DarkThemeProvider>(context);
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
                  trailingWidget: Obx(
                    () => GestureDetector(
                      onTap: () {
                        //Get.toNamed(AppRouteNames.userProfileEditRoute);
                        log('UserDetails.roleId: ${UserDetails.categoryId}');
                        if (UserDetails.categoryId == "1") {
                          Get.to(() => UserProfileEditScreen(),
                                  transition: Transition.native,
                                  duration: const Duration(milliseconds: 500))!
                              .then((value) async {
                            controller.petTopList.clear();
                            controller.pageIndex = 1;
                            controller.hasMore = true;
                            await controller.getUserProfileFunction();

                            indexController.isLoading(true);
                            indexController.isLoading(false);
                          });
                        } else if (UserDetails.categoryId == "2") {
                          Get.to(() => ShopUserProfileScreen(),
                                  transition: Transition.native,
                                  duration: const Duration(milliseconds: 500))!
                              .then((value) async {
                            controller.petTopList.clear();
                            controller.pageIndex = 1;
                            controller.hasMore = true;
                            await controller.getShopProfileFunction();
                            indexController.isLoading(true);
                            indexController.isLoading(false);
                          });
                        } else if (UserDetails.categoryId == "3") {
                          Get.to(() => NgoUserProfileScreen(),
                                  transition: Transition.native,
                                  duration: const Duration(milliseconds: 500))!
                              .then((value) async {
                            controller.petTopList.clear();
                            controller.pageIndex = 1;
                            controller.hasMore = true;
                            await controller.getNgoProfileFunction();
                            indexController.isLoading(true);
                            indexController.isLoading(false);
                          });
                        } else if (UserDetails.categoryId == "4") {
                          Get.to(() => TrainersAndUserProfileScreenController(),
                                  transition: Transition.native,
                                  duration: const Duration(milliseconds: 500))!
                              .then((value) async {
                            controller.petTopList.clear();
                            controller.pageIndex = 1;
                            controller.hasMore = true;
                            await controller.getTrainerProfileFunction();
                            indexController.isLoading(true);
                            indexController.isLoading(false);
                          });
                        }
                      },
                      child: UserDetails.categoryId == "1"
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: Colors.black, width: 0.0),
                              ),
                              child: ClipRRect(
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.black, width: 0.0),
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  controller.userprofile.value,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, st, ob) {
                                    return Image.asset(
                                      AppImages.petMetLogoImg,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  // width: controller.size.width * 0.05,
                                ),
                              ),
                            )
                          : UserDetails.categoryId == "2"
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    controller.shopProfile.value,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, st, ob) {
                                      return Image.asset(
                                        AppImages.petMetLogoImg,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    // width: controller.size.width * 0.05,
                                  ),
                                )
                              : UserDetails.categoryId == "3"
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        controller.ngoProfile.value,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, st, ob) {
                                          return Image.asset(
                                              AppImages.petMetLogoImg,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover);
                                        },
                                        // width: controller.size.width * 0.05,
                                      ),
                                    )
                                  : UserDetails.categoryId == "4"
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            controller.trainerProfile.value,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, st, ob) {
                                              return Image.asset(
                                                  AppImages.petMetLogoImg,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover);
                                            },
                                            // width: controller.size.width * 0.05,
                                          ),
                                        )
                                      : Image.asset(
                                          AppImages.userProfileImg,
                                          width: controller.size.width * 0.12,
                                        ),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : RefreshIndicator(
                      color: AppColors.accentColor,
                            onRefresh: () {
                              return Future.delayed(const Duration(seconds: 1),
                                  () {
                                if (UserDetails.categoryId == "1") {
                                  controller.getUserProfileFunction();
                                } else if (UserDetails.categoryId == "2") {
                                  controller.getShopProfileFunction();
                                } else if (UserDetails.categoryId == "3") {
                                  controller.getNgoProfileFunction();
                                } else if (UserDetails.categoryId == "4") {
                                  controller.getTrainerProfileFunction();
                                }
                              });
                            },
                            child: SingleChildScrollView(
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  PetListModule()
                                      .commonSymmetricPadding(horizontal: 20),
                                  SizedBox(
                                      height: controller.size.height * 0.025),
                                  BannerModule(),
                                  const SizedBox(height: 10),
                                  PetShopAndGroomingText()
                                      .commonSymmetricPadding(horizontal: 20),

                                  // Expanded(child: PetTopListModule()),
                                  PetTopListModule(),
                                  // DogDisplayWidget(
                                  //   onTap: () {
                                  //     Get.toNamed(
                                  //         AppRouteNames.orderDetailsRoute);
                                  //   },
                                  // ),
                                  // AllPetsListModule()
                                  //     .commonSymmetricPadding(horizontal: 20),
                                ],
                              ).commonSymmetricPadding(vertical: 20),
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
}

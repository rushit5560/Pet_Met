import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_list_screen_controller.dart';
import 'package:pet_met/screens/pet_meeting_details_screen/pet_meeting_details_screen.dart';
import 'package:pet_met/screens/user_profile_screen/user_profile_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_images.dart';

class PetMeetingListModule extends StatelessWidget {
  PetMeetingListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingListScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return screenController.subCatPetList.isEmpty
        ? const Center(
            child: Text(
              "Pet not available in this category!",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          )
        : ListView.builder(
            itemCount: screenController.subCatPetList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              log("${ApiUrl.apiImagePath}${screenController.subCatPetList[i].data.image}");
              return dogDisplayWidget(i);
            },
          );
  }

  Widget dogDisplayWidget(int i) {
    return Row(
      children: [
        Expanded(
          // flex: 45,
          child: Container(
            height: screenController.size.height * 0.25,
            width: screenController.size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              // image: const DecorationImage(
              //     image: AssetImage("assets/images/dog1.png"),
              //     fit: BoxFit.cover),
            ),
            child: GestureDetector(
              onTap: () {
                // Get.toNamed(AppRouteNames.userProfileRoute);
                Get.to(
                  () => PetMeetingDetailsScreen(),
                  arguments: [
                    screenController.subCatPetList[i].data.id,
                    screenController.subCatPetList[i].data.userid,
                    screenController.subCatPetList[i].data.categoryId,
                  ],
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                // child: Image.network(
                //   ApiUrl.apiImagePath + homeController.petTopList[index].image,
                //   fit: BoxFit.cover,
                // )
                child: Image.network(
                  ApiUrl.apiImagePath +
                      "asset/uploads/petimage/" +
                      screenController.subCatPetList[i].data.image,
                  errorBuilder: (context, st, ob) {
                    return Image.asset(AppImages.petMetLogoImg);
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          // flex: 55,
          child: Container(
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(
                      () => PetMeetingDetailsScreen(),
                  arguments: [
                    screenController.subCatPetList[i].data.id,
                    screenController.subCatPetList[i].data.userid,
                    screenController.subCatPetList[i].data.categoryId,
                  ],
                );
              },
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        screenController.subCatPetList[i].data.petName,
                        style: TextStyle(
                          color: AppColors.accentTextColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Html(
                        data: screenController.subCatPetList[i].data.details,
                        style: {
                          "body": Style(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.blackTextColor.withOpacity(0.6),
                            fontSize: const FontSize(15.0),
                            fontWeight: FontWeight.w500,
                          ),
                        },
                      ),
                      // Text(
                      //   homeController.petTopList[index].details,
                      //   style: TextStyle(
                      //     color: themeProvider.darkTheme
                      //         ? AppColors.whiteColor
                      //         : AppColors.blackTextColor.withOpacity(0.6),
                      //     fontSize: 10.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 12),
                      Text(
                        screenController.subCatPetList[i].data.gender + ", 2 Years Old",
                        style: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor.withOpacity(0.65)
                              : AppColors.greyTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const SizedBox(width: 3),
                          Image.asset(
                            AppIcons.locationImg,
                            height: 16,
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor.withOpacity(0.65)
                                : AppColors.blackTextColor.withOpacity(0.6),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Distance: 3.6 km",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor.withOpacity(0.65)
                                  : AppColors.blackTextColor.withOpacity(0.6),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).commonSymmetricPadding(horizontal: 12, vertical: 14),

                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        //Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute, arguments: homeController.petTopList[index].id);
                        log('Follow Userid: ${screenController.subCatPetList[i].data.userid}');
                        log('Follow Categoryid: ${screenController.subCatPetList[i].data.categoryId}');
                        Get.to(() => UserProfileScreen(),
                            transition: Transition.native,
                            duration: const Duration(milliseconds: 500),
                            arguments: [
                              screenController.subCatPetList[i].data.userid,
                              screenController.subCatPetList[i].data.categoryId,
                              screenController.subCatPetList[i].data.id,
                            ]);
                      },
                      child: Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          // color: AppColors.greyColor,
                          // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.accentTextColor)
                        ),
                        child: Image.network(ApiUrl.apiImagePath + "assets/uploads/petimage" +
                            screenController.subCatPetList[i].img,
                            errorBuilder: (context, st, ob) {
                              return Image.asset(AppImages.petMetLogoImg);
                            },
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ).commonAllSidePadding(padding: 10);
  }
}

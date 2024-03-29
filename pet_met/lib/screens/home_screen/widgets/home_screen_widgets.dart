import 'dart:developer';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/screens/own_user_story_viewer_screen/own_user_story_viewer_screen.dart';
import 'package:pet_met/screens/pet_meeting_details_screen/pet_meeting_details_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/screens/story_viewer_screen/story_viewer_screen.dart';
import 'package:pet_met/screens/user_profile_screen/user_profile_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/home_controller.dart';
import '../../../services/providers/dark_theme_provider.dart';
import '../../shop_details_screen/shop_details_screen.dart';

class PetTopListModule extends StatelessWidget {
  PetTopListModule({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();

  // DarkThemeProvider themeProvider =
  //     Provider.of<DarkThemeProvider>(Get.context!);
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: homeController.petTopList.length + 1,
      // controller: homeController.scrollController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        // PetList singlePet = homeController.petTopList[i];

        if (i < homeController.petTopList.length) {
          return Row(
            children: [
              Expanded(
                // flex: 45,
                child: Container(
                  height: homeController.size.height * 0.25,
                  width: homeController.size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: themeProvider.darkTheme
                        ? AppColors.darkThemeBoxColor
                        : AppColors.whiteColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRouteNames.userProfileRoute);
                      Get.to(
                        () => PetMeetingDetailsScreen(),
                        arguments: [
                          homeController.petTopList[i].data.id,
                          homeController.petTopList[i].data.userid,
                          homeController.petTopList[i].data.categoryId,
                          homeController.petTopList[i].name.displayName,
                          // homeController.petTopList[i].name.displayName,
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
                            homeController.petTopList[i].data.image,
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
                          homeController.petTopList[i].data.id,
                          homeController.petTopList[i].data.userid,
                          homeController.petTopList[i].data.categoryId,
                          homeController.petTopList[i].name.displayName,
                          // homeController.petTopList[i].name.displayName
                        ],
                      );
                    },
                    child: SizedBox(
                      height: homeController.size.height * 0.2,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                homeController.petTopList[i].data.petName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.accentTextColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.08,
                                child: Html(
                                  data: homeController
                                      .petTopList[i].data.details
                                      .trim(),
                                  shrinkWrap: true,
                                  style: {
                                    "body": Style(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor
                                              .withOpacity(0.6),
                                      fontSize: FontSize(10.sp),
                                      fontWeight: FontWeight.w500,
                                      maxLines: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    "p": Style(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor
                                              .withOpacity(0.6),
                                      fontSize: FontSize(10.sp),
                                      fontWeight: FontWeight.w500,
                                      maxLines: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    "b": Style(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                      fontSize: FontSize(10.sp),
                                      fontWeight: FontWeight.w500,
                                      maxLines: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    "span": Style(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                      fontSize: FontSize(10.sp),
                                      fontWeight: FontWeight.w500,
                                      maxLines: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  },
                                ),
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
                              // const SizedBox(height: 12),
                              Text(
                                homeController.petTopList[i].data.gender +
                                    ", ${homeController.petTopList[i].data.dob}",
                                style: TextStyle(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor.withOpacity(0.65)
                                      : AppColors.greyTextColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // const SizedBox(height: 25),
                              // Row(
                              //   children: [
                              //     const SizedBox(width: 3),
                              //     Image.asset(
                              //       AppIcons.locationImg,
                              //       height: 16,
                              //       color: themeProvider.darkTheme
                              //           ? AppColors.whiteColor.withOpacity(0.65)
                              //           : AppColors.blackTextColor
                              //               .withOpacity(0.6),
                              //     ),
                              //     const SizedBox(width: 8),
                              //     Text(
                              //       "Distance: 3.6 km",
                              //       style: TextStyle(
                              //         color: themeProvider.darkTheme
                              //             ? AppColors.whiteColor.withOpacity(0.65)
                              //             : AppColors.blackTextColor
                              //                 .withOpacity(0.6),
                              //         fontSize: 10.sp,
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ).commonSymmetricPadding(
                              horizontal: 12, vertical: 16),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                log('Follow Userid: ${homeController.petTopList[i].data.userid}');
                                log('Follow Category id: ${homeController.petTopList[i].data.categoryId}');

                                // ignore: unrelated_type_equality_checks

                                homeController.petTopList[i].data.categoryId ==
                                        2.toString()
                                    ? Get.to(
                                        () => ShopDetailsScreen(),
                                        arguments: homeController
                                            .petTopList[i].data.id
                                            .toString(),
                                      )
                                    : Get.to(
                                        () => UserProfileScreen(),
                                        transition: Transition.native,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        arguments: [
                                          homeController
                                              .petTopList[i].data.userid,
                                          homeController
                                              .petTopList[i].data.categoryId,
                                          homeController.petTopList[i].data.id,
                                        ],
                                      );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    homeController
                                        .petTopList[i].name.displayName,
                                    style: TextStyle(
                                      color: AppColors.accentTextColor,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    height: 3.5.h,
                                    width: 3.5.h,
                                    decoration: BoxDecoration(
                                      // color: AppColors.greyColor,
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: AppColors.accentTextColor,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        ApiUrl.apiImagePath +
                                            "asset/uploads/product/" +
                                            homeController
                                                .petTopList[i].img.image,
                                        errorBuilder: (context, st, ob) {
                                          return Image.asset(
                                            themeProvider.darkTheme
                                                ? AppImages.cameraImg
                                                : AppImages
                                                    .cameraPlaceHolderImglight,
                                            fit: BoxFit.fitWidth,
                                          );
                                        },
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).commonAllSidePadding(padding: 10);
        } else {
          return homeController.hasMore
              ? const CustomAnimationLoader()
              : Center(
                  child: Text(
                  "No more pets!",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor.withOpacity(0.6),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ));
        }
      },
    );
  }
}

/*class PetTopListModule extends StatefulWidget {
  const PetTopListModule({Key? key}) : super(key: key);

  @override
  State<PetTopListModule> createState() => _PetTopListModuleState();
}
class _PetTopListModuleState extends State<PetTopListModule> {
  final HomeController homeController = Get.find<HomeController>();

  final size = Get.size;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return //homeController.petTopList.isNotEmpty ?
      NotificationListener<ScrollNotification>(
      onNotification: (scrollState) {
        if (!homeController.isLoadMore && scrollState is ScrollEndNotification &&
            scrollState.metrics.pixels == scrollState.metrics.maxScrollExtent &&
            _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
          setState(() async {
            homeController.isLoadMore = true;
            homeController.pageIndex = homeController.pageIndex + 1;
             await homeController.getAllPetFunction();
          });
          log('homeController.isLoadMore: ${homeController.isLoadMore}');
        }
        return false;
      },
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: homeController.petTopList.length,
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                PetList petList = homeController.petTopList[index];
                return Row(
                  children: [
                    Expanded(
                      // flex: 45,
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.45,
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
                          onTap: (){
                            // Get.toNamed(AppRouteNames.userProfileRoute);
                            Get.to(()=> PetMeetingDetailsScreen(), arguments: petList.id);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            // child: Image.network(
                            //   ApiUrl.apiImagePath + homeController.petTopList[index].image,
                            //   fit: BoxFit.cover,
                            // )
                            child: Image.network(
                              ApiUrl.apiImagePath + petList.image,
                              errorBuilder: (context, st, ob){
                                return Image.asset(AppImages.petMetLogoImg);
                              },
                              fit: BoxFit.cover,),
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
                          onTap: (){
                            //Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute, arguments: homeController.petTopList[index].id);
                            log('Follow Userid: ${petList.userid}');
                            log('Follow Categoryid: ${petList.categoryId}');
                            Get.to(()=> UserProfileScreen(),
                                transition: Transition.native,
                                duration: const Duration(milliseconds: 500),
                                arguments: [petList.userid, petList.categoryId, petList.id]);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                petList.petName,
                                style: TextStyle(
                                  color: AppColors.accentTextColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Html(
                                data: petList.details,
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
                                petList.gender + ", 2 Years Old",
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
                        ),
                      ),
                    ),
                  ],
                ).commonAllSidePadding(padding: 10);
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(height: 15);
              },

            ),
          ),
          homeController.isLoadMore == true
              ? Container(
            height: 20,
            width: 30,
            color: Colors.black,
            child: const CircularProgressIndicator(color: Colors.black,),
          )
              : Container(
            color: Colors.transparent,
            height: 20,
            width: 30,
          ),
        ],
      ),
    );
  }


}*/

/*class DogDisplayWidget extends StatelessWidget {
  const DogDisplayWidget({Key? key}) : super(key: key);

  // const DogDisplayWidget({
  //   Key? key,
  //   this.onTap,
  // }) : super(key: key);
  //
  // final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    final size = Get.size;
    return GestureDetector(
      onTap: (){
        //Get.toNamed(AppRouteNames.orderDetailsRoute);

      },
      child: Row(
        children: [
          Expanded(
            // flex: 45,
            child: Container(
              height: size.height * 0.25,
              width: size.width * 0.45,
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
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AppImages.petImg,
                    fit: BoxFit.cover,
                  )),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sola",
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "AccoAdyssinian Dog",
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor.withOpacity(0.6),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Female, 2 Years Old",
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
            ),
          ),
        ],
      ).commonAllSidePadding(padding: 10),
    );
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: size.width * 0.38,
            width: size.width * 0.43,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sola",
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 4),
                  Text(
                    "AccoAdyssinian Dog",
                    style: TextStyle(
                      color: AppColors.blackTextColor.withOpacity(0.6),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Female, 2 Years Old",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      SizedBox(width: 3),
                      Image.asset(
                        "assets/icons/location.png",
                        height: 16,
                        color: AppColors.blackTextColor.withOpacity(0.6),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Distance: 3.6 km",
                        style: TextStyle(
                          color: AppColors.blackTextColor.withOpacity(0.6),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/dog1.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/

// ignore: must_be_immutable
class PetListModule extends StatelessWidget {
  PetListModule({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    // List<String> userWiseStoryList = [];
                    // for (int i = 0; i < controller.userStoryList[index].data.length; i++) {
                    //   userWiseStoryList.add(controller.userStoryList[index].data[i].image);
                    // }
                    // log('userWiseStoryList: $userWiseStoryList');
                    if (controller.ownUserStoryList.isNotEmpty) {
                      Get.to(() => OwnUserStoryViewerScreen(),
                          arguments: controller.ownUserStoryList);
                    }
                  },
                  child: Container(
                    // height: controller.size.width * 0.145,
                    // width: controller.size.width * 0.145,
                    height: 6.h,
                    width: 6.h,
                    margin: const EdgeInsets.only(bottom: 5, right: 5),
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage(
                      //       controller.dogsTopList[index],
                      //     ),
                      //     fit: BoxFit.cover),
                      //color: AppColors.greyTextColor,
                      border: Border.all(
                        color: AppColors.accentTextColor,
                        width: 0.5,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    //child: Image.asset(AppImages.petMetLogoImg, fit: BoxFit.cover),
                    child: UserDetails.categoryId == "1"
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              controller.userprofile.value,
                              errorBuilder: (context, st, ob) {
                                return Image.asset(
                                    themeProvider.darkTheme
                                        ? AppImages.cameraImg
                                        : AppImages.cameraPlaceHolderImglight,
                                    fit: BoxFit.contain);
                              },
                              fit: BoxFit.contain,
                            ),
                          )
                        : UserDetails.categoryId == "2"
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  controller.shopProfile.value,
                                  errorBuilder: (context, st, ob) {
                                    return Image.asset(
                                      themeProvider.darkTheme
                                          ? AppImages.cameraImg
                                          : AppImages.cameraPlaceHolderImglight,
                                      fit: BoxFit.contain,
                                    );
                                  },
                                  fit: BoxFit.contain,
                                ),
                              )
                            : UserDetails.categoryId == "3"
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      controller.ngoProfile.value,
                                      errorBuilder: (context, st, ob) {
                                        return Image.asset(
                                          themeProvider.darkTheme
                                              ? AppImages.cameraImg
                                              : AppImages
                                                  .cameraPlaceHolderImglight,
                                          fit: BoxFit.contain,
                                        );
                                      },
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : UserDetails.categoryId == "4"
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          controller.trainerProfile.value,
                                          errorBuilder: (context, st, ob) {
                                            return Image.asset(
                                              themeProvider.darkTheme
                                                  ? AppImages.cameraImg
                                                  : AppImages
                                                      .cameraPlaceHolderImglight,
                                              fit: BoxFit.contain,
                                            );
                                          },
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : Container(),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      modelBottomSheet(context);
                    },
                    child: Container(
                      height: 2.h,
                      width: 2.h,
                      decoration: const BoxDecoration(
                          color: AppColors.accentColor, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16)
          ],
        ),
        const SizedBox(width: 5),
        Expanded(
          child: SizedBox(
            height: controller.size.width * 0.21,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.userStoryList.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemBuilder: (context, index) {
                return AddPetStoryWidget(
                  controller: controller,
                  index: index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  modelBottomSheet(BuildContext context) {
    // DarkThemeProvider themeProvider =
    //     Provider.of<DarkThemeProvider>(Get.context!);
    showModalBottomSheet<void>(
      context: context,
      constraints: null,
      builder: (BuildContext context) {
        return Container(
          color: themeProvider.darkTheme
              ? AppColors.blackTextColor
              : AppColors.whiteColor,
          height: controller.size.height * 0.16,
          child: Column(
            children: [
              ListTile(
                onTap: getFromCamera,
                contentPadding:
                    EdgeInsets.only(left: controller.size.width * 0.1),
                title: Text(
                  "Select Image From Camera",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    //color: AppColors.blackTextColor.withOpacity(0.7),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.only(left: controller.size.width * 0.1),
                onTap: getFromGallery,
                title: Text(
                  "Select Image From Gallery",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    //color: AppColors.blackTextColor.withOpacity(0.7),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Get from gallery
  getFromGallery() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      controller.imageFile = File(pickedFile.path);
      controller.loadUI();
      controller.imageFile = File(pickedFile.path);
      log('Camera File Path : ${controller.imageFile}');
      Get.back();
      controller.addUserStoryFunction();
      //Get.to(() => EditStoryScreen(), arguments: controller.imageFile!.path);

      log('Camera Image Path : ${controller.imageFile!.path}');

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {
      Get.back();
    }

    // if(controller.imageFile != null){
    //
    // }else {
    //   print("image is not picked.....!");
    // }
    //setState(() {});
    //Get.back();
  }

  /// Get from Camera
  getFromCamera() async {
    // XFile? pickedFile = await ImagePicker().pickImage(
    //   source: ImageSource.camera,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    // if (pickedFile != null) {
    //   setState(() {
    //     controller.imageFile = XFile(pickedFile.path);
    //   });
    // }
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      //setState(() {
      controller.imageFile = File(pickedFile.path);
      controller.loadUI();
      log('Camera File Path : ${controller.imageFile}');
      log('Camera Image Path : ${controller.imageFile!.path}');
      controller.imageFile = File(pickedFile.path);
      Get.back();
      controller.addUserStoryFunction();

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {
      Get.back();
    }

    // setState(() {});
    // Get.back();
  }
}

class AddPetStoryWidget extends StatelessWidget {
  AddPetStoryWidget({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    //DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        List<String> userWiseStoryList = [];
        for (int i = 0; i < controller.userStoryList[index].data.length; i++) {
          userWiseStoryList.add(controller.userStoryList[index].data[i].image);
        }
        log('userWiseStoryList: $userWiseStoryList');
        Get.to(() => StoryViewerScreen(), arguments: userWiseStoryList);
      },
      child: Column(
        children: [
          Container(
              height: controller.size.width * 0.145,
              width: controller.size.width * 0.145,
              margin: const EdgeInsets.only(bottom: 5, right: 5),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage(
                //       controller.dogsTopList[index],
                //     ),
                //     fit: BoxFit.cover),
                border: Border.all(color: AppColors.accentColor, width: 0.5),
                //color: AppColors.greyTextColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  ApiUrl.apiImagePath +
                      "asset/uploads/product/" +
                      controller.userStoryList[index].userimg,
                  errorBuilder: (context, st, ob) {
                    return Image.asset(AppImages.petMetLogoImg);
                  },
                  fit: BoxFit.contain,
                ),
              )
              // Image.asset(AppImages.petMetLogoImg)
              ),
          SizedBox(
            width: controller.size.width * 0.145,
            child: Text(
              controller.userStoryList[index].username,
              maxLines: 1,
              style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}

/*class AllPetsListModule extends StatelessWidget {
  AllPetsListModule({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: controller.dogsTopList.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(width: 10);
      },
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: controller.size.width * 0.16,
              width: controller.size.width * 0.16,
              margin: const EdgeInsets.only(bottom: 5, right: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      controller.dogsTopList[index],
                    ),
                    fit: BoxFit.cover),
                color: AppColors.greyTextColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            index == 0
                ? Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: 12,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }
}*/

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    /*return Container(
      height: controller.size.height * 0.2,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/icons/dogbanner.png")),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );*/
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: controller.bannerList1.length,
          itemBuilder: (context, index, realIndex) {
            // final imgUrl = ApiUrl.apiImagePath +
            //     controller.bannerList[index].brandImage;
            return _imageModule(index);
          },
          options: CarouselOptions(
            height: Get.height * 0.18,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              controller.activeIndex.value = index;
            },
          ),
        ),
        // SizedBox(height: 8),
        // ImageBannerIndicator(),
      ],
    );
  }

  Widget _imageModule(int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => ShopDetailsScreen(),
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 500),
                arguments: controller.bannerList1[index].id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(
                  ApiUrl.apiImagePath +
                      "asset/uploads/product/" +
                      "${controller.bannerList1[index].img}",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.only(left: 10),
        //   alignment: Alignment.centerLeft,
        //   child: Row(
        //     children: [
        //       Expanded(
        //         flex: 1,
        //         child: Text(
        //           controller.bannerList[index].title,
        //           maxLines: 2,
        //           overflow: TextOverflow.ellipsis,
        //           style: const TextStyle(
        //             color: AppColors.accentColor,
        //             fontSize: 24,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //       Expanded(child: Container()),
        //     ],
        //   ),
        // ),
      ],
    ).commonSymmetricPadding(horizontal: 20);
  }
}

class ImageBannerIndicator extends StatelessWidget {
  ImageBannerIndicator({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.bannerList1.length,
          (index) => Container(
            margin: const EdgeInsets.all(4),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: controller.activeIndex.value == index
                  ? AppColors.accentTextColor
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class PetShopAndGroomingText extends StatelessWidget {
  PetShopAndGroomingText({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();
  final indexController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            // indexController.isLoading(true);
            // indexController.selectedBottomIndex.value = 0;
            // indexController.isLoading(false);
            // log("indexController.selectedbottomIndex.value : ${indexController.selectedBottomIndex.value}");
            Get.to(
              () => ShopAndGroomingScreen(),
              duration: const Duration(milliseconds: 500),
            );
          },
          child: Container(
            // height: 35,
            // width: controller.size.width * 0.40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppIcons.shopImg,
                  width: 4.w,
                  height: 4.w,
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.accentTextColor,
                ),
                const SizedBox(width: 8),
                Text(
                  "Pet Shops, Cafe & Grooming",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.accentTextColor,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).commonSymmetricPadding(horizontal: 8, vertical: 10),
          ),
        ),
      ],
    );
  }
}

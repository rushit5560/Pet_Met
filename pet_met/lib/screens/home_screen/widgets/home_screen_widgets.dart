import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_controller.dart';
import '../../../services/providers/dark_theme_provider.dart';

class PetTopListModule extends StatelessWidget {
  PetTopListModule({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  final size = Get.size;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return dogDisplayWidget(index);
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(height: 15);
      },
      itemCount: homeController.petTopList.length,
    );
  }

  Widget dogDisplayWidget(int index){
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRouteNames.orderDetailsRoute);
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
                  // child: Image.network(
                  //   ApiUrl.apiImagePath + homeController.petTopList[index].image,
                  //   fit: BoxFit.cover,
                  // )
                child: Image.network(
                  ApiUrl.apiImagePath + homeController.petTopList[index].image,
                  errorBuilder: (context, st, ob){
                    return Image.asset(AppImages.petMetLogoImg);
                  },
                  fit: BoxFit.cover,),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeController.petTopList[index].petName,
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    homeController.petTopList[index].details,
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
                    homeController.petTopList[index].gender + ", 2 Years Old",
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
  }
}

class DogDisplayWidget extends StatelessWidget {
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
        Get.toNamed(AppRouteNames.orderDetailsRoute);
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
    /*return GestureDetector(
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
    );*/
  }
}

class PetListModule extends StatelessWidget {
  PetListModule({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: controller.size.width * 0.16,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.dogsTopList.length,
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
    );
  }
}

class AddPetStoryWidget extends StatelessWidget {
  const AddPetStoryWidget({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
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
      ),
    );
  }
}

class AllPetsListModule extends StatelessWidget {
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
}

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
          itemCount: controller.bannerList.length,
          itemBuilder: (context, index, realIndex) {
            // final imgUrl = ApiUrl.apiImagePath +
            //     controller.bannerList[index].brandImage;
            return _imageModule(index);
          },
          options: CarouselOptions(
            height: 165,
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(
                  ApiUrl.apiImagePath + controller.bannerList[index].imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  controller.bannerList[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
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
          controller.bannerList.length,
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
            indexController.isLoading(true);
            indexController.selectedBottomIndex.value = 0;
            indexController.isLoading(false);
            log("indexController.selectedbottomIndex.value : ${indexController.selectedBottomIndex.value}");
          },
          child: Container(
            height: 35,
            width: controller.size.width * 0.40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "Pet Shop & Grooming",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.accentTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

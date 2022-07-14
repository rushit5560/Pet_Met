import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_controller.dart';
import '../../../services/providers/dark_theme_provider.dart';

class DogDisplayWidget extends StatelessWidget {
  const DogDisplayWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    final size = Get.size;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            // flex: 45,
            child: Container(
              height: size.height * 0.25,
              width: size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(12),
                ),
                color: themeProvider.darkTheme
                    ? AppColors.darkThemeBoxColor
                    : AppColors.whiteColor,
                image: const DecorationImage(
                    image: AssetImage("assets/images/dog1.png"),
                    fit: BoxFit.cover),
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
                borderRadius: BorderRadius.only(
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
                        "assets/icons/location.png",
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
    return Container(
      height: controller.size.width * 0.16,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
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
      ),
    );
  }
}

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.size.height * 0.2,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/icons/dogbanner.png")),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class PetShopAndGroomingText extends StatelessWidget {
  PetShopAndGroomingText({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 35,
          width: controller.size.width * 0.36,
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
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_profile_controller.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../services/providers/dark_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

class ContactContainerWidget extends StatelessWidget {
  const ContactContainerWidget({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  final imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.accentColor.withOpacity(0.3),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.googleMapImg,
      height: controller.size.width * 0.35,
    );
  }
}

class ProfileDetailsModule extends StatelessWidget {
  const ProfileDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.darkTheme
            ? AppColors.darkThemeColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyTextColor.withOpacity(0.3),
            blurRadius: 35,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Monika A",
            style: TextStyle(
              color: AppColors.accentTextColor,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(width: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.locateHomeImg,
                height: 15,
              ),
              const SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: "California, Walk suite (",
                  style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "2 km",
                      style: TextStyle(
                        color: AppColors.accentTextColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ")",
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GetPersonalInfoModule extends StatelessWidget {
  const GetPersonalInfoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRouteNames.userProfileEditRoute);
            },
            child: Text(
              "Get Personal Info",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blackTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInfoModule extends StatelessWidget {
  const ContactInfoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 80,
      // margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.darkTheme
            ? AppColors.darkThemeColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyTextColor.withOpacity(0.3),
            blurRadius: 35,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ContactContainerWidget(
              imagePath: AppImages.infoGreenImg,
            ),
            const SizedBox(width: 20),
            const ContactContainerWidget(
              imagePath: AppImages.phoneGreenImg,
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteNames.addressRoute);
              },
              child: const ContactContainerWidget(
                imagePath: AppImages.locateGreenImg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogOwnerListModule extends StatelessWidget {
  DogOwnerListModule({Key? key}) : super(key: key);
  final controller = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          child: Row(
            children: [
              Text(
                "Dog Owner Feild",
                style: TextStyle(
                  color: AppColors.accentTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 8.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dogsTopList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: 8.h,
                    width: 7.h,
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
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRouteNames.uploadPetRoute);
                            },
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
                          ),
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class AboutModule extends StatelessWidget {
  const AboutModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: controller.size.height * 0.25,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: themeProvider.darkTheme
            ? AppColors.darkThemeBoxColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyTextColor.withOpacity(0.3),
            blurRadius: 35,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "About",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                AppImages.editIconImg,
                height: 25,
                color: themeProvider.darkTheme
                    ? Colors.grey
                    : AppColors.whiteColor,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "The cat (Felis catus) is a domestic species of small carnivorous mammal.[1][2] It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.",
            style: TextStyle(
                fontSize: 12.sp,
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontWeight: FontWeight.w300,
                wordSpacing: 1,
                height: 1.2),
          ),
        ],
      ),
    );
  }
}

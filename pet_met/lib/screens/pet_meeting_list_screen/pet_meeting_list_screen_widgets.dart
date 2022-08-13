import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_images.dart';

class PetMeetingListModule extends StatelessWidget {
  PetMeetingListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingAndBreadingScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.searchList.isEmpty ?
        const Center(
          child: Text("No Results Found", style: TextStyle(color: Colors.black, fontSize: 17),),
        ) :
      ListView.builder(
      itemCount: screenController.searchList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        // return DogDisplayWidget(
        //   // onTap: () {
        //   //   Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute);
        //   // },
        // );
        return dogDisplayWidget(i);
      },
    ) ;
  }

  Widget dogDisplayWidget(int index){
    return GestureDetector(
      onTap: (){
        //Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute, arguments: screenController.searchList[index].mainCategoryId);
      },
      child: Row(
        children: [
          Expanded(
            // flex: 45,
            child: Container(
              height: Get.height * 0.25,
              width: Get.width * 0.45,
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
                //  Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute, arguments: homeController.petTopList[index].id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  // child: Image.network(
                  //   ApiUrl.apiImagePath + homeController.petTopList[index].image,
                  //   fit: BoxFit.cover,
                  // )
                  child: Image.network(
                    ApiUrl.apiImagePath + screenController.searchList[index].categoryImage,
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
                  //Get.toNamed(AppRouteNames.userProfileRoute, arguments: homeController.petTopList[index].userid);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      screenController.searchList[index].categoryName,
                      style: TextStyle(
                        color: AppColors.accentTextColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Html(
                    //   data: screenController.searchList[index].categoryMetaDescrtiption != null ?
                    //   screenController.searchList[index].categoryMetaDescrtiption : "ABC",
                    //   style: {
                    //     "body": Style(
                    //       color: themeProvider.darkTheme
                    //           ? AppColors.whiteColor
                    //           : AppColors.blackTextColor.withOpacity(0.6),
                    //       fontSize: FontSize(15.0),
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   },
                    // ),
                    Text(
                      screenController.searchList[index].categoryMetaDescrtiption != null ?
                      screenController.searchList[index].categoryMetaDescrtiption : "ABC",
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.6),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Text(
                    //   homeController.petTopList[index].gender + ", 2 Years Old",
                    //   style: TextStyle(
                    //     color: themeProvider.darkTheme
                    //         ? AppColors.whiteColor.withOpacity(0.65)
                    //         : AppColors.greyTextColor,
                    //     fontSize: 11.sp,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
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
      ).commonAllSidePadding(padding: 10),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_care_info_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class PetCareListModule extends StatelessWidget {
  PetCareListModule({Key? key}) : super(key: key);
  final controller = Get.find<PetCareInfoController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    /*return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.title,
            style: TextStyle(
              color: AppColors.accentTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: controller.size.height * 0.001.h),
          Html(
            data: controller.description,
            // style: {
            //   "body": Style(
            //     textDecorationColor: themeProvider.darkTheme
            //         ? AppColors.whiteColor
            //         : AppColors.blackTextColor,
            //     // color: themeProvider.darkTheme
            //     //     ? AppColors.whiteColor
            //     //     : AppColors.blackTextColor,
            //     // textDecorationColor: themeProvider.darkTheme
            //     //     ? AppColors.whiteColor
            //     //     : AppColors.blackTextColor,
            //   ),
            // },
          ),
        ],
      ),
    );*/
    return SizedBox(
      //height: controller.size.height * 0.85,
      child: controller.petCareList.isEmpty ?
          const Center(child: Text("No pet care information")):
      ListView.separated(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: controller.petCareList.length,
        separatorBuilder: (ctx, ind) {
          return SizedBox(
            height: 2.5.h,
          );
        },
        itemBuilder: (ctx, ind) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentTextColor,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 15,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      controller.petCareList[ind].title,
                      style: TextStyle(
                        color: AppColors.accentTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: controller.size.height * 0.001.h),
                    Html(
                      data: controller.petCareList[ind].content,
                      // style: {
                      //   "body": Style(
                      //     textDecorationColor: themeProvider.darkTheme
                      //         ? AppColors.whiteColor
                      //         : AppColors.blackTextColor,
                      //     // color: themeProvider.darkTheme
                      //     //     ? AppColors.whiteColor
                      //     //     : AppColors.blackTextColor,
                      //     // textDecorationColor: themeProvider.darkTheme
                      //     //     ? AppColors.whiteColor
                      //     //     : AppColors.blackTextColor,
                      //   ),
                      // },
                    ),
                  ],
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}

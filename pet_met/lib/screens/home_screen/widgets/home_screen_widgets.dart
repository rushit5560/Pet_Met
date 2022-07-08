import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_controller.dart';

class DogDisplayWidget extends StatelessWidget {
  const DogDisplayWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
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
}

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_met/utils/app_colors.dart';

class CustomAnimationLoader extends StatelessWidget {
  const CustomAnimationLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 85,
          child: Lottie.asset(
            "assets/json/loader.json",
          )
          // LoadingAnimationWidget.staggeredDotsWave(
          //   color: AppColors.accentTextColor,
          //   size: 40,
          // ),
          ),
    );
  }
}

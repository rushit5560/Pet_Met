import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_screen_controller.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class SearchTrainersTextFieldModule extends StatelessWidget {
  SearchTrainersTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetTrainersScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Form(
      key: screenController.formKey,
      child: Stack(
        children: [
          Container(
            height: screenController.size.height * 0.065,
            width: screenController.size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.25),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: screenController.searchFieldController,
            validator: (val) => Validations().validateSearchTextField(val!),
            cursorColor: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.accentTextColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              fillColor: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.75)
                    : AppColors.greyTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: GestureDetector(
                onTap: () async {

                  // if(screenController.searchFieldController.text.trim().isEmpty){
                  //   screenController.isLoading(true);
                  //   screenController.searchSubCatList.clear();
                  //   screenController.isLoading(false);
                  // } else{
                  //   await screenController.getSearchCategoryAndSubCategoryFunction();
                  // }
                  // hideKeyboard();

                  if(screenController.formKey.currentState!.validate()){
                    screenController.searchFieldController.clear();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentTextColor),
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ).commonAllSidePadding(padding: 5),
                ).commonAllSidePadding(padding: 8),
              ),
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 20),
    );
  }
}


class PetTrainerListModule extends StatelessWidget {
  PetTrainerListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.trainersList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        Trainers trainerSingleItem = screenController.trainersList[i];
        return _petTrainerListTile(trainerSingleItem);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _petTrainerListTile(Trainers trainerSingleItem) {
    String imgUrl = ApiUrl.apiImagePath + trainerSingleItem.image;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.petTrainerDetailsScreenRoute,
            arguments: trainerSingleItem.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              themeProvider.darkTheme ? AppColors.darkThemeColor : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 0),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 65,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(30),
              //   color: Colors.grey,
              // ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imgUrl, errorBuilder: (context, er, ob) {
                    return Image.asset(AppImages.petMetLogoImg);
                  })),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainerSingleItem.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(height: 1.w),
                  Text(
                    trainerSingleItem.address,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }
}

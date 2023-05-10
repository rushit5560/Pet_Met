import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_screen_controller.dart';
import 'package:pet_met/models/pet_vets_and_ngo_screen_models.dart';
import 'package:pet_met/screens/pet_vets_and_ngo_details_screen/pet_vets_and_ngo_details_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_functions/hide_keyboard.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';



class SearchVetAndNgoTextFieldModule extends StatelessWidget {
  SearchVetAndNgoTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetVetsAndNgoScreenController>();

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
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
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
                  screenController.isLoading(true);
                  if (screenController.searchFieldController.text
                      .trim()
                      .isNotEmpty) {
                    screenController.searchVetAndNgoList = screenController
                        .vetAndNgoList
                        .where((u) => (u.name.toLowerCase().contains(
                            screenController.searchFieldController.text
                                .toLowerCase())))
                        .toList();
                    //screenController.searchFieldController.clear();
                    hideKeyboard();
                    log('screenController.searchVetAndNgoList: ${screenController.searchVetAndNgoList.length}');
                  }
                  screenController.isLoading(false);
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
            onChanged: (value) {
              if (value.isEmpty) {
                screenController.isLoading(true);
                screenController.searchVetAndNgoList.clear();
                screenController.isLoading(false);
              }
            },
          ),
        ],
      ).commonSymmetricPadding(horizontal: 20),
    );
  }
}

class VetsAndNgoListModule extends StatelessWidget {
  VetsAndNgoListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return screenController.searchVetAndNgoList.isEmpty
        ? ListView.builder(
            itemCount: screenController.vetAndNgoList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              VetAndNgoData vetAndNgoData = screenController.vetAndNgoList[i];
              return _vetsAndNgoListTile(vetAndNgoData, themeProvider);
            },
          ).commonAllSidePadding(padding: 10)
        : ListView.builder(
            itemCount: screenController.searchVetAndNgoList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              VetAndNgoData searchVetAndNgoData =
                  screenController.searchVetAndNgoList[i];
              return searchVetsAndNgoListTile(
                  searchVetAndNgoData, themeProvider);
            },
          ).commonAllSidePadding(padding: 10);
  }

  Widget _vetsAndNgoListTile(
      VetAndNgoData vetAndNgoData, DarkThemeProvider themeProvider) {
    String imgUrl =
        ApiUrl.apiImagePath + "asset/uploads/product/" + vetAndNgoData.image;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => PetVetsAndNgoDetailsScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500),
          arguments: vetAndNgoData.id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                /*Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),*/
                Container(
                  width: 75,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.grey),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 1.5,
                    //     spreadRadius: 1.5
                    //   )
                    // ]
                    //color: Colors.grey,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imgUrl,
                      // fit: BoxFit.cover,
                      errorBuilder: (context, er, ob) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            AppImages.petMetLogoImg,
                            // fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vetAndNgoData.name,
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
                        vetAndNgoData.address,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            vetAndNgoData.isVerified == "1"
                ?
                Image.asset(
                    AppIcons.verifiedSymbolImg,
                    width: 25,
                    height: 25,
                  )
                : Container(),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }

  Widget searchVetsAndNgoListTile(
      VetAndNgoData searchVetAndNgoData, DarkThemeProvider themeProvider) {
    String imgUrl = ApiUrl.apiImagePath +
        "asset/uploads/product/" +
        searchVetAndNgoData.image;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => PetVetsAndNgoDetailsScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500),
          arguments: searchVetAndNgoData.id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          boxShadow: const [
            // BoxShadow(
            //   color: Colors.grey.shade300,
            //   blurRadius: 5,
            //   spreadRadius: 1,
            //   blurStyle: BlurStyle.outer,
            // ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 0),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                /*Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),*/
                Container(
                  width: 75,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.grey),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 1.5,
                    //     spreadRadius: 1.5
                    //   )
                    // ]
                    //color: Colors.grey,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imgUrl,
                      // fit: BoxFit.cover,
                      errorBuilder: (context, er, ob) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(AppImages.petMetLogoImg),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        searchVetAndNgoData.name,
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
                        searchVetAndNgoData.address,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            searchVetAndNgoData.isVerified == "1"
                ?
                Image.asset(
                    AppIcons.verifiedSymbolImg,
                    width: 25,
                    height: 25,
                  )
                : Container(),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_and_grooming_screen_controller.dart';
import 'package:pet_met/models/shop_and_grooming_screen_model/all_shop_model.dart';
import 'package:pet_met/screens/shop_details_screen/shop_details_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_functions/hide_keyboard.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';




class ShopAndGroomingScreenAppBar extends StatelessWidget {
  ShopAndGroomingScreenAppBar({Key? key}) : super(key: key);
  final screenController = Get.find<ShopAndGroomingScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenController.size.height * 0.065,
      width: Get.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side Button Module
          GestureDetector(
            onTap: () => Get.back(),
            child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                AppIcons.backButtonImg,
              ),
            ).commonSymmetricPadding(horizontal: 20, vertical: 15),
          ),

          // Title Text Module
          /*Expanded(
            child:*/
          const Expanded(
            child: Text(
              'Pet Shops, Cafe & Grooming',
              maxLines: 1,
              // textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 22,
                color: AppColors.accentTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // ),

          // Right Side Button Module
          // SizedBox(
          //   height: 25,
          //   width: 25,
          //   child: widget.trailingWidget,
          // ).commonSymmetricPadding(horizontal: 20, vertical: 8),
        ],
      ),
    );
  }
}



class SearchShopTextFieldModule extends StatelessWidget {
  SearchShopTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopAndGroomingScreenController>();

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
                    screenController.searchShopsList = screenController
                        .shopsList
                        .where((u) => (u.shopename.toLowerCase().contains(
                            screenController.searchFieldController.text
                                .toLowerCase())))
                        .toList();
                    //screenController.searchFieldController.clear();
                    hideKeyboard();
                    log('screenController.searchShopsList: ${screenController.searchShopsList.length}');
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
                screenController.searchShopsList.clear();
                screenController.isLoading(false);
              }
            },
          ),
        ],
      ).commonSymmetricPadding(horizontal: 20),
    );
  }
}

class ShopListModule extends StatelessWidget {
  ShopListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopAndGroomingScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return screenController.searchShopsList.isEmpty
        ? ListView.builder(
            itemCount: screenController.shopsList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              ShopData shopSingleItem = screenController.shopsList[i];
              return _shopListTile(shopSingleItem);
            },
          ).commonAllSidePadding(padding: 10)
        : ListView.builder(
            itemCount: screenController.searchShopsList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              ShopData searchShopItem = screenController.searchShopsList[i];
              return searchShopListTile(searchShopItem);
            },
          ).commonAllSidePadding(padding: 10);
  }

  Widget _shopListTile(ShopData shopSingleItem) {
    String imgUrl = ApiUrl.apiImagePath + shopSingleItem.showimg;
    return GestureDetector(
      onTap: () {
        Get.to(() => ShopDetailsScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500),
            arguments: shopSingleItem.id);
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
              blurRadius: 1,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                Container(
                  width: 75,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.grey),
                    //   boxShadow: const [
                    //     BoxShadow(
                    //         color: Colors.grey,
                    //         blurRadius: 1.5,
                    //         spreadRadius: 1.5
                    //     )
                    //   ]
                    //color: Colors.grey,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(imgUrl, fit: BoxFit.cover,
                          errorBuilder: (context, er, ob) {
                        return Image.asset(AppImages.petMetLogoImg);
                      })),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shopSingleItem.shopename,
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
                        shopSingleItem.address,
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
            ),
            shopSingleItem.isVerified == "0"
                ? /*Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accentTextColor,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  )*/
            Image.asset(AppIcons.verifiedSymbolImg,
              width: 25,
              height: 25,
            )
                : Container(),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }

  Widget searchShopListTile(ShopData searchShopItem) {
    String imgUrl = ApiUrl.apiImagePath + searchShopItem.showimg;
    return GestureDetector(
      onTap: () {
        Get.to(() => ShopDetailsScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500),
            arguments: searchShopItem.id);
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
              blurRadius: 1,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                Container(
                  width: 75,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.grey),
                    //   boxShadow: const [
                    //     BoxShadow(
                    //         color: Colors.grey,
                    //         blurRadius: 1.5,
                    //         spreadRadius: 1.5
                    //     )
                    //   ]
                    //color: Colors.grey,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(imgUrl, fit: BoxFit.cover,
                          errorBuilder: (context, er, ob) {
                        return Image.asset(AppImages.petMetLogoImg);
                      })),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        searchShopItem.shopename,
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
                        searchShopItem.address,
                        maxLines: 3,
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
            ),
            searchShopItem.isVerified == "0"
                ? /*Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accentTextColor,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  )*/
            Image.asset(AppIcons.verifiedSymbolImg,
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

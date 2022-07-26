import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/home_screen_models/banner_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';

class HomeController extends GetxController {
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  RxBool isOpened = false.obs;
  List<BannerData> bannerList = [];

  var drawerController = ZoomDrawerController();

  List dogsTopList = [
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
    AppImages.petImg,
  ];

  // toggleMenu([bool end = false]) {
  //   if (end) {
  //     final _state = endSideMenuKey.currentState!;
  //     if (_state.isOpened) {
  //       _state.closeSideMenu();
  //     } else {
  //       _state.openSideMenu();
  //     }
  //   } else {
  //     final _state = sideMenuKey.currentState!;
  //     if (_state.isOpened) {
  //       _state.closeSideMenu();
  //     } else {
  //       _state.openSideMenu();
  //     }
  //   }
  // }

  /// Get All Banner
  Future<void> getAllBannerFunction() async {
    isLoading(true);
    String url = ApiUrl.bannerApi;
    log("Banner Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Banner Api Response : ${response.body}");

      BannerModel bannerModel =
          BannerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bannerModel.success.obs;

      if (isSuccessStatus.value) {
        bannerList.clear();
        bannerList.addAll(bannerModel.data);
        log("bannerList Length : ${bannerList.length}");
      } else {
        log("Banner Api Else");
      }
    } catch (e) {
      log("Banner Api Error ::: $e");
    } finally {
      isLoading(false);
      // await getAllPetFunction();
    }
  }

  /* Future<void> getAllPetFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPetApi;

    log("all pets Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("all pets Api Response : ${response.body}");
      allPetListModel = AllPetListModel.fromJson(json.decode(response.body));
      isSuccessStatus = allPetListModel.success!.obs;

      if (isSuccessStatus.value) {
        allPetData = allPetListModel.data!.first;
        log("all pets overview  : ${allPetData.subCategory}");
      } else {
        log("all pets Api Else Else");
      }
    } catch (e) {
      log("all pets Error ::: $e");
    } finally {
      isLoading(false);
    }
  }*/

  /// Get All Pets
  /*Future<void> getAllPetFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPetApi;
    log("All Pet Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Get All Pet Api response : ${response.body}");



    } catch(e) {
      log("Get All Pet Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }*/

  @override
  void onInit() {
    super.onInit();
    getAllBannerFunction();
    // getAllPetFunction();
  }
}

/*class AllPetListModel {
  bool? success;
  List<AllPetData>? data;
  String? message;

  AllPetListModel({this.success, this.data, this.message});

  AllPetListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AllPetData>[];
      json['data'].forEach((v) {
        data!.add(new AllPetData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AllPetData {
  MainCategoryID? mainCategoryID;
  List<SubCategory>? subCategory;

  AllPetData({this.mainCategoryID, this.subCategory});

  AllPetData.fromJson(Map<String, dynamic> json) {
    mainCategoryID = json['main_categoryID'] != null
        ? new MainCategoryID.fromJson(json['main_categoryID'])
        : null;
    if (json['sub_category'] != null) {
      subCategory = <SubCategory>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainCategoryID != null) {
      data['main_categoryID'] = this.mainCategoryID!.toJson();
    }
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainCategoryID {
  int? categoryID;
  String? categoryName;
  Null? categoryMetaTitle;
  Null? categoryMetaDescrtiption;
  Null? categoryMetaKeyword;
  String? categoryImage;
  Null? parent;
  String? sortOrder;
  int? isActive;
  String? createdDate;
  Null? updatedDate;
  int? createdBy;
  Null? modifiedBy;

  MainCategoryID(
      {this.categoryID,
      this.categoryName,
      this.categoryMetaTitle,
      this.categoryMetaDescrtiption,
      this.categoryMetaKeyword,
      this.categoryImage,
      this.parent,
      this.sortOrder,
      this.isActive,
      this.createdDate,
      this.updatedDate,
      this.createdBy,
      this.modifiedBy});

  MainCategoryID.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    categoryName = json['categoryName'];
    categoryMetaTitle = json['categoryMetaTitle'];
    categoryMetaDescrtiption = json['categoryMetaDescrtiption'];
    categoryMetaKeyword = json['categoryMetaKeyword'];
    categoryImage = json['categoryImage'];
    parent = json['parent'];
    sortOrder = json['sort_order'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryID'] = this.categoryID;
    data['categoryName'] = this.categoryName;
    data['categoryMetaTitle'] = this.categoryMetaTitle;
    data['categoryMetaDescrtiption'] = this.categoryMetaDescrtiption;
    data['categoryMetaKeyword'] = this.categoryMetaKeyword;
    data['categoryImage'] = this.categoryImage;
    data['parent'] = this.parent;
    data['sort_order'] = this.sortOrder;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    return data;
  }
}

class SubCategory {
  int? categoryID;
  int? mainCategoryID;
  String? categoryName;
  Null? categoryMetaTitle;
  Null? categoryMetaDescrtiption;
  Null? categoryMetaKeyword;
  String? categoryImage;
  Null? parent;
  String? sortOrder;
  int? isActive;
  String? createdDate;
  Null? updatedDate;
  int? createdBy;
  Null? modifiedBy;

  SubCategory(
      {this.categoryID,
      this.mainCategoryID,
      this.categoryName,
      this.categoryMetaTitle,
      this.categoryMetaDescrtiption,
      this.categoryMetaKeyword,
      this.categoryImage,
      this.parent,
      this.sortOrder,
      this.isActive,
      this.createdDate,
      this.updatedDate,
      this.createdBy,
      this.modifiedBy});

  SubCategory.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    mainCategoryID = json['main_categoryID'];
    categoryName = json['categoryName'];
    categoryMetaTitle = json['categoryMetaTitle'];
    categoryMetaDescrtiption = json['categoryMetaDescrtiption'];
    categoryMetaKeyword = json['categoryMetaKeyword'];
    categoryImage = json['categoryImage'];
    parent = json['parent'];
    sortOrder = json['sort_order'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryID'] = this.categoryID;
    data['main_categoryID'] = this.mainCategoryID;
    data['categoryName'] = this.categoryName;
    data['categoryMetaTitle'] = this.categoryMetaTitle;
    data['categoryMetaDescrtiption'] = this.categoryMetaDescrtiption;
    data['categoryMetaKeyword'] = this.categoryMetaKeyword;
    data['categoryImage'] = this.categoryImage;
    data['parent'] = this.parent;
    data['sort_order'] = this.sortOrder;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    return data;
  }
}*/

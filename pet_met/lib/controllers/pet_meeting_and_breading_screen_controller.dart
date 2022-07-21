import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/api_url.dart';

class PetMeetingAndBreadingScreenController extends GetxController {
  final size = Get.size;

  TextEditingController searchFieldController = TextEditingController();

  RxBool checkBoxValue = false.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  CategoryData categoriesData = CategoryData();

  PetCategorySubCategoryModel petCategoriesModel =
      PetCategorySubCategoryModel();

  Future<void> getAllCategoriesFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllCategoryApi;

    log("get all pet category Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("get all pet category Api Response : ${response.body}");
      petCategoriesModel =
          PetCategorySubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = petCategoriesModel.success!.obs;

      if (isSuccessStatus.value) {
        categoriesData = petCategoriesModel.data!.first;
        log("get all pet category overview  : ${petCategoriesModel.data!.first.mainCategoryID!.categoryName}");
      } else {
        log("get all pet category  Api Else Else");
      }
    } catch (e) {
      log("get all pet category  Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllCategoriesFunction();
    super.onInit();
  }
}

class PetCategorySubCategoryModel {
  bool? success;
  List<CategoryData>? data;
  String? message;

  PetCategorySubCategoryModel({this.success, this.data, this.message});

  PetCategorySubCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
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

class CategoryData {
  MainCategoryID? mainCategoryID;
  List<SubCategory>? subCategory;

  CategoryData({this.mainCategoryID, this.subCategory});

  CategoryData.fromJson(Map<String, dynamic> json) {
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
}

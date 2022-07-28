// To parse this JSON data, do
//
//     final getPetSubCategoryModel = getPetSubCategoryModelFromJson(jsonString);

import 'dart:convert';

GetPetSubCategoryModel getPetSubCategoryModelFromJson(String str) => GetPetSubCategoryModel.fromJson(json.decode(str));

String getPetSubCategoryModelToJson(GetPetSubCategoryModel data) => json.encode(data.toJson());

class GetPetSubCategoryModel {
  GetPetSubCategoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<PetSubCategory> data;
  String message;

  factory GetPetSubCategoryModel.fromJson(Map<String, dynamic> json) => GetPetSubCategoryModel(
    success: json["success"] ?? false,
    data: List<PetSubCategory>.from(json["data"].map((x) => PetSubCategory.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PetSubCategory {
  PetSubCategory({
    this.categoryId,
    this.mainCategoryId,
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
    this.modifiedBy,
  });

  int ? categoryId;
  int ? mainCategoryId;
  String ? categoryName;
  String ? categoryMetaTitle;
  String ? categoryMetaDescrtiption;
  String ? categoryMetaKeyword;
  String ? categoryImage;
  String ? parent;
  String ? sortOrder;
  int ? isActive;
  String ? createdDate;
  String ? updatedDate;
  int ? createdBy;
  String ? modifiedBy;

  factory PetSubCategory.fromJson(Map<String, dynamic> json) => PetSubCategory(
    categoryId: json["categoryID"] ?? 0,
    mainCategoryId: json["main_categoryID"] ?? 0,
    categoryName: json["categoryName"] ?? "",
    categoryMetaTitle: json["categoryMetaTitle"] ?? "",
    categoryMetaDescrtiption: json["categoryMetaDescrtiption"] ?? "",
    categoryMetaKeyword: json["categoryMetaKeyword"] ?? "",
    categoryImage: json["categoryImage"] ?? "",
    parent: json["parent"] ?? "",
    sortOrder: json["sort_order"] ?? "",
    isActive: json["is_active"] ?? "",
    createdDate: json["created_date"] ?? "",
    updatedDate: json["updated_date"] ?? "",
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
    "main_categoryID": mainCategoryId,
    "categoryName": categoryName,
    "categoryMetaTitle": categoryMetaTitle,
    "categoryMetaDescrtiption": categoryMetaDescrtiption,
    "categoryMetaKeyword": categoryMetaKeyword,
    "categoryImage": categoryImage,
    "parent": parent,
    "sort_order": sortOrder,
    "is_active": isActive,
    "created_date": createdDate,
    "updated_date": updatedDate,
    "created_by": createdBy,
    "modified_by": modifiedBy,
  };
}

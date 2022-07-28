// To parse this JSON data, do
//
//     final getPetCategoryModel = getPetCategoryModelFromJson(jsonString);

import 'dart:convert';

GetPetCategoryModel getPetCategoryModelFromJson(String str) => GetPetCategoryModel.fromJson(json.decode(str));

String getPetCategoryModelToJson(GetPetCategoryModel data) => json.encode(data.toJson());

class GetPetCategoryModel {
  GetPetCategoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<PetCategory> data;
  String message;

  factory GetPetCategoryModel.fromJson(Map<String, dynamic> json) => GetPetCategoryModel(
    success: json["success"] ?? false,
    data: List<PetCategory>.from(json["data"].map((x) => PetCategory.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PetCategory {
  PetCategory({
    this.categoryId,
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

  factory PetCategory.fromJson(Map<String, dynamic> json) => PetCategory(
    categoryId: json["categoryID"] ?? 0,
    categoryName: json["categoryName"] ?? "",
    categoryMetaTitle: json["categoryMetaTitle"] ?? "",
    categoryMetaDescrtiption: json["categoryMetaDescrtiption"] ?? "",
    categoryMetaKeyword: json["categoryMetaKeyword"] ?? "",
    categoryImage: json["categoryImage"] ?? "",
    parent: json["parent"] ?? "",
    sortOrder: json["sort_order"] ?? "",
    isActive: json["is_active"] ?? 0,
    createdDate: json["created_date"] ?? "",
    updatedDate: json["updated_date"] ?? "",
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
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

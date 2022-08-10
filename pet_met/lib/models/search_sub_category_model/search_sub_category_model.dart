// To parse this JSON data, do
//
//     final searchCategoryAndSubCategoryModel = searchCategoryAndSubCategoryModelFromJson(jsonString);

import 'dart:convert';

SearchCategoryAndSubCategoryModel searchCategoryAndSubCategoryModelFromJson(String str) => SearchCategoryAndSubCategoryModel.fromJson(json.decode(str));

String searchCategoryAndSubCategoryModelToJson(SearchCategoryAndSubCategoryModel data) => json.encode(data.toJson());

class SearchCategoryAndSubCategoryModel {
  SearchCategoryAndSubCategoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory SearchCategoryAndSubCategoryModel.fromJson(Map<String, dynamic> json) => SearchCategoryAndSubCategoryModel(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.categoryId,
    required this.mainCategoryId,
    required this.categoryName,
    required this.categoryMetaTitle,
    required this.categoryMetaDescrtiption,
    required this.categoryMetaKeyword,
    required this.categoryImage,
    required this.parent,
    required this.sortOrder,
    required this.isActive,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  String categoryId;
  String mainCategoryId;
  String categoryName;
  String categoryMetaTitle;
  String categoryMetaDescrtiption;
  String categoryMetaKeyword;
  String categoryImage;
  String parent;
  String sortOrder;
  String isActive;
  String createdDate;
  String updatedDate;
  String createdBy;
  String modifiedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["categoryID"] ?? "",
    mainCategoryId: json["main_categoryID"] ?? "",
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
    createdBy: json["created_by"] ?? "",
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

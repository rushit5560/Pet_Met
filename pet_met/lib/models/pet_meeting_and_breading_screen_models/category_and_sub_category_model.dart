import 'dart:convert';

CategoryAndSubCategoryModel categoryAndSubCategoryModelFromJson(String str) => CategoryAndSubCategoryModel.fromJson(json.decode(str));

String categoryAndSubCategoryModelToJson(CategoryAndSubCategoryModel data) => json.encode(data.toJson());

class CategoryAndSubCategoryModel {
  CategoryAndSubCategoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<CatAndSubCatData> data;
  String message;

  factory CategoryAndSubCategoryModel.fromJson(Map<String, dynamic> json) => CategoryAndSubCategoryModel(
    success: json["success"] ?? false,
    data: List<CatAndSubCatData>.from(json["data"].map((x) => CatAndSubCatData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CatAndSubCatData {
  CatAndSubCatData({
    required this.mainCategoryId,
    required this.subCategory,
  });

  MainCategoryId mainCategoryId;
  List<SubCategoryId> subCategory;

  factory CatAndSubCatData.fromJson(Map<String, dynamic> json) => CatAndSubCatData(
    mainCategoryId: MainCategoryId.fromJson(json["main_categoryID"] ?? {}),
    subCategory: List<SubCategoryId>.from(json["sub_category"].map((x) => SubCategoryId.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "main_categoryID": mainCategoryId.toJson(),
    "sub_category": List<dynamic>.from(subCategory.map((x) => x.toJson())),
  };
}

class MainCategoryId {
  MainCategoryId({
    required this.categoryId,
    required this.categoryName,
    // required this.categoryMetaTitle,
    // required this.categoryMetaDescrtiption,
    // required this.categoryMetaKeyword,
    required this.categoryImage,
    // required this.parent,
    required this.sortOrder,
    required this.isActive,
    // required this.createdDate,
    // required this.updatedDate,
    // required this.createdBy,
    // required this.modifiedBy,
  });

  int categoryId;
  String categoryName;
  // dynamic categoryMetaTitle;
  // dynamic categoryMetaDescrtiption;
  // dynamic categoryMetaKeyword;
  String categoryImage;
  // dynamic parent;
  String sortOrder;
  int isActive;
  // DateTime createdDate;
  // dynamic updatedDate;
  // int createdBy;
  // dynamic modifiedBy;

  factory MainCategoryId.fromJson(Map<String, dynamic> json) => MainCategoryId(
    categoryId: json["categoryID"] ?? 0,
    categoryName: json["categoryName"] ?? "",
    // categoryMetaTitle: json["categoryMetaTitle"],
    // categoryMetaDescrtiption: json["categoryMetaDescrtiption"],
    // categoryMetaKeyword: json["categoryMetaKeyword"],
    categoryImage: json["categoryImage"] ?? "",
    // parent: json["parent"],
    sortOrder: json["sort_order"] ?? "",
    isActive: json["is_active"] ?? 0,
    // createdDate: DateTime.parse(json["created_date"]),
    // updatedDate: json["updated_date"],
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
    "categoryName": categoryName,
    // "categoryMetaTitle": categoryMetaTitle,
    // "categoryMetaDescrtiption": categoryMetaDescrtiption,
    // "categoryMetaKeyword": categoryMetaKeyword,
    "categoryImage": categoryImage,
    // "parent": parent,
    "sort_order": sortOrder,
    "is_active": isActive,
    // "created_date": createdDate.toIso8601String(),
    // "updated_date": updatedDate,
    // "created_by": createdBy,
    // "modified_by": modifiedBy,
  };
}

class SubCategoryId {
  SubCategoryId({
    required this.categoryId,
    required this.mainCategoryId,
    required this.categoryName,
    // required this.categoryMetaTitle,
    // required this.categoryMetaDescrtiption,
    // required this.categoryMetaKeyword,
    required this.categoryImage,
    // required this.parent,
    required this.sortOrder,
    required this.isActive,
    required this.isSelected,
    // required this.createdDate,
    // required this.updatedDate,
    // required this.createdBy,
    // required this.modifiedBy,
  });

  int categoryId;
  int mainCategoryId;
  String categoryName;
  // dynamic categoryMetaTitle;
  // dynamic categoryMetaDescrtiption;
  // dynamic categoryMetaKeyword;
  String categoryImage;
  // dynamic parent;
  String sortOrder;
  int isActive;
  bool isSelected;
  // DateTime createdDate;
  // dynamic updatedDate;
  // int createdBy;
  // dynamic modifiedBy;

  factory SubCategoryId.fromJson(Map<String, dynamic> json) => SubCategoryId(
    categoryId: json["categoryID"] ?? 0,
    mainCategoryId: json["main_categoryID"] ?? 0,
    categoryName: json["categoryName"] ?? "",
    // categoryMetaTitle: json["categoryMetaTitle"],
    // categoryMetaDescrtiption: json["categoryMetaDescrtiption"],
    // categoryMetaKeyword: json["categoryMetaKeyword"],
    categoryImage: json["categoryImage"] ?? "",
    // parent: json["parent"],
    sortOrder: json["sort_order"] ?? "",
    isActive: json["is_active"] ?? 0,
    isSelected: false
    // createdDate: DateTime.parse(json["created_date"]),
    // updatedDate: json["updated_date"],
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
    "main_categoryID": mainCategoryId,
    "categoryName": categoryName,
    // "categoryMetaTitle": categoryMetaTitle,
    // "categoryMetaDescrtiption": categoryMetaDescrtiption,
    // "categoryMetaKeyword": categoryMetaKeyword,
    "categoryImage": categoryImage,
    // "parent": parent,
    "sort_order": sortOrder,
    "is_active": isActive,
    // "created_date": createdDate.toIso8601String(),
    // "updated_date": updatedDate,
    // "created_by": createdBy,
    // "modified_by": modifiedBy,
  };
}


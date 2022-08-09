import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/get_all_pet_list_model/get_all_pet_list_model.dart';
import 'package:pet_met/models/get_user_story_model/add_user_story_model.dart';
import 'package:pet_met/models/get_user_story_model/get_user_story_model.dart';
import 'package:pet_met/models/home_screen_models/banner_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/user_details.dart';

class HomeController extends GetxController {
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  File? imageFile;

  RxBool isOpened = false.obs;
  List<Datum> bannerList = [];
  List<PetList> petTopList = [];
  List<DatumDatum> imageList = [];
  List<GetUserStoryModelDatum> userStoryList = [];

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
      //isLoading(false);
       await getAllPetFunction();
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
  Future<void> getAllPetFunction() async {
    isLoading(true);
    String url = ApiUrl.topPetListApi;
    log("All Pet Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get All Pet Api response : ${response.body}");

      GetPetTopListModel getPetTopListModel =
      GetPetTopListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetTopListModel.success.obs;

      if (isSuccessStatus.value) {
        // bannerList.clear();
        petTopList.addAll(getPetTopListModel.data);
        log("petList Length : ${petTopList.length}");
      } else {
        log("Pet Api Else");
      }

    } catch(e) {
      log("Get All Pet Api Error ::: $e");
    } finally {
      //isLoading(false);
      await getUserStory();
    }
  }

  /// Get User Story
  Future<void> getUserStory() async {
    isLoading(true);
    String url = ApiUrl.getUserStoryApi + '${UserDetails.userId}';
    log("Get User story Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get All USer Story Api response : ${response.body}");

      GetUserStoryModel getUserStoryModel =
      GetUserStoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserStoryModel.success.obs;

      if (isSuccessStatus.value) {
        // bannerList.clear();
        for(int i=0; i< getUserStoryModel.data.length; i++){
          userStoryList.addAll(getUserStoryModel.data);
          log("userStoryList Length : ${userStoryList.length}");
          imageList.addAll(getUserStoryModel.data[i].data);
        }

      } else {
        log("User Story Api Else");
      }

    } catch(e) {
      log("Get All USer Story Api Error ::: $e");
    } finally {
      isLoading(false);
      //await getUserStory();
    }
  }

  /// Add User Story
  Future<void> addUserStoryFunction() async {
    isLoading(true);

    String url = ApiUrl.addUserStoryApi;
    log("Add User Story Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      if (imageFile != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        stream.cast();

        var length = await imageFile!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        //request.headers.addAll(header);

        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['categoryID'] = "${UserDetails.categoryId}";

        // request.fields['name'] = "demo1";
        // request.fields['bod'] = "10-9-2014";
        // request.fields['phone'] = "1234567890";
        // request.fields['gender'] = "female";

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        // var multiFile = await http.MultipartFile.fromPath(
        //  "image",
        //   file!.path,
        // );

        request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          log('value: $value');
          AddUserStoryModel addUserStoryModel =
          AddUserStoryModel.fromJson(json.decode(value));
          log('response1 :::::: ${addUserStoryModel.success}');
          isSuccessStatus = addUserStoryModel.success.obs;

          if (isSuccessStatus.value) {
            await getUserStory();
            Fluttertoast.showToast(msg: addUserStoryModel.message);
            Get.back();
          } else {
            log('False False');
          }
        });
      } else {
        print("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        //request.headers.addAll(header);

        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['categoryID'] = "${UserDetails.categoryId}";
        //request.fields['showimg'] = "jgjadg";

        // var multiPart = http.MultipartFile(
        //   'file',
        //   stream,
        //   length,
        // );
        //
        // request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          log('value: $value');
          AddUserStoryModel addUserStoryModel =
          AddUserStoryModel.fromJson(json.decode(value));
          log('response1 :::::: ${addUserStoryModel.success}');
          isSuccessStatus = addUserStoryModel.success.obs;

          if (isSuccessStatus.value) {
            await getUserStory();
            Fluttertoast.showToast(msg: addUserStoryModel.message);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

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

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/get_all_pet_list_model/get_all_pet_list_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/get_user_story_model/add_user_story_model.dart';
import 'package:pet_met/models/get_user_story_model/get_user_story_model.dart';
import 'package:pet_met/models/home_screen_models/banner_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_get_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:sizer/sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import '../models/home_screen_models/show_banner_model.dart';

class HomeController extends GetxController {
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;

  File? imageFile;

  RxBool isOpened = false.obs;
  // List<Datum> bannerList = [];
  List<SingleBannerModel> bannerList1 = [];

  List<PetDatum> petTopList = [];
  List<Userstory> imageList = [];
  List<GetUserStoryModelDatum> userStoryList = [];

  List<Userstory> ownUserStoryList = [];

  List<Petdatum> petList = [];
  List<ShopPet> shopPetList = [];
  List<NgoPet> ngoPetList = [];
  List<TrainerPet> trainerPetList = [];

  List<PetList> petList1 = [];
  final storyController = StoryController();

  int pageIndex = 1;
  // bool isLoadMore = false;

  RxString userprofile = "".obs;
  String userName = "";

  RxString shopProfile = "".obs;
  String shopName = "";
  String shopDescription = "";

  RxString ngoProfile = "".obs;
  String ngoName = "";
  String ngoDescription = "";

  RxString trainerProfile = "".obs;
  String trainerName = "";
  String trainerDescription = "";

  //final userProfileController = Get.find<UserProfileController>().followShopUserId;

  var drawerController = ZoomDrawerController();
  String petTopFollowCategoryId = "";

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
      Map<String, dynamic> bodyData = {
        "latitude": UserDetails.liveLatitude,
        "longitude": UserDetails.liveLongitude
      };
      // Map<String, String> header = apiHeader.apiHeader();
      log("Home Banner bodyData : $bodyData");

      http.Response response = await http.post(
        Uri.parse(url),
        // headers: header,
        body: bodyData,
      );
      log("Banner Api Response : ${response.body}");

      BannerModel bannerModel =
          BannerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bannerModel.success.obs;

      if (isSuccessStatus.value) {
        bannerList1.clear();
        for (int i = 0; i < bannerModel.data.length; i++) {
          if (bannerModel.data[i].image1 != "") {
            bannerList1.add(
              SingleBannerModel(
                img: bannerModel.data[i].image1,
                id: bannerModel.data[i].id,
              ),
            );
          }
          // if (bannerModel.data[i].image2 != "") {
          //   bannerList1.add(SingleBannerModel(
          //       img: bannerModel.data[i].image2, id: bannerModel.data[i].id));
          // }
          // if (bannerModel.data[i].image3 != "") {
          //   bannerList1.add(SingleBannerModel(
          //       img: bannerModel.data[i].image3, id: bannerModel.data[i].id));
          // }
          // if (bannerModel.data[i].image4 != "") {
          //   bannerList1.add(SingleBannerModel(
          //       img: bannerModel.data[i].image4, id: bannerModel.data[i].id));
          // }
          // if (bannerModel.data[i].image5 != "") {
          //   bannerList1.add(SingleBannerModel(
          //       img: bannerModel.data[i].image5, id: bannerModel.data[i].id));
          // }
        }
        // log("bannerList Length : ${bannerList.length}");
      } else {
        log("Banner Api Else");
      }
    } catch (e) {
      log("Banner Api Error ::: $e");
    } finally {
      // isLoading(false);
      await getUserStory();
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
  /* Future<void> getAllPetFunction() async {
    isLoading(true);
    String url = ApiUrl.topPetListApi + "?page=$pageIndex";
    log("All Pet Api Url : $url");
    log('pageIndex: $pageIndex');

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
        log('pet image1: ${ApiUrl.apiImagePath + petTopList[0].image}');
      } else {
        log("Pet Api Else");
      }

    } catch(e) {
      log("Get All Pet Api Error ::: $e");
    } finally {
      //isLoading(false);
      await getUserStory();
    }
  }*/

  Future<void> getAllIncrementPetFunction() async {
    if (hasMore == true) {
      String url = ApiUrl.topPetListApi + "?page=$pageIndex";
      log("All Pet Api Url : $url");
      log('pageIndex Api: $pageIndex');

      try {
        Map<String, dynamic> bodyData = {
          "latitude": UserDetails.liveLatitude,
          "longitude": UserDetails.liveLongitude
        };
        Map<String, String> header = apiHeader.apiHeader();
        log("header : $header");
        log("bodyData : $bodyData");

        http.Response response = await http.post(
          Uri.parse(url),
          // headers: header,
          body: bodyData,
        );
        log("Get All Pet Api response : ${response.body}");

        GetPetTopListModel getPetTopListModel =
        GetPetTopListModel.fromJson(json.decode(response.body));

        isSuccessStatus = getPetTopListModel.success.obs;

        if (isSuccessStatus.value) {
          // bannerList.clear();

          if (getPetTopListModel.data.isEmpty) {
            hasMore = false;
          } else {
            petTopList.addAll(getPetTopListModel.data);
            log("petList Length : ${petTopList.length}");
            log('pet image1: ${ApiUrl.apiImagePath + "asset/uploads/petimage/" + petTopList[0].data.image}');
            for (int i = 0; i < petTopList.length; i++) {
              petTopFollowCategoryId = petTopList[i].data.categoryId.toString();
            }
            // for (int i = 0; i < petTopList.length; i++) {
            //   petTopFollowCategoryId = petTopList[i].data.categoryId;
            // }

            // If get all pet then change the hasMore flag
            if (getPetTopListModel.data.length < 10) {
              hasMore = false;
            }
          }
        } else {
          log("Pet Api Else");
        }
      } catch (e) {
        log("Get All Pet Api Error ::: ${e.toString()}");
      } finally {
        loadUI();
        // await getUserStory();
      }
    } else {
      isLoading(false);
    }
  }

  /// Get User Story
  Future<void> getUserStory(
      {StoryOption storyOption = StoryOption.moveForward}) async {
    isLoading(true);
    String url = ApiUrl.getUserStoryApi + UserDetails.selfId;
    //String url = ApiUrl.getUserStoryApi + petTopFollowCategoryId == "2" ? userProfileController : "";
    log("Get User story Api Url : $url");

    try {
      // Map<String, String> header = apiHeader.apiHeader();
      // log("header 1111: $header");

      http.Response response = await http.get(Uri.parse(url));
      log("Get All USer Story Api response : ${response.body}");

      GetUserStoryModel getUserStoryModel =
          GetUserStoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserStoryModel.success.obs;

      if (isSuccessStatus.value) {
        userStoryList.clear();

        for (int i = 0; i < getUserStoryModel.date.length; i++) {
          if (getUserStoryModel.date[i].data.isNotEmpty) {
            userStoryList.add(getUserStoryModel.date[i]);
          }
        }

        log("userStoryList Length 1212 : ${userStoryList.length}");

        ownUserStoryList = getUserStoryModel.userstory;
        log('ownUserStoryList: $ownUserStoryList');

        // for(int i=0; i < getUserStoryModel.date.length; i++) {
        //   /*for(int j=0; i < getUserStoryModel.data[i].data.length; j++){
        //     imageList.addAll(getUserStoryModel.data[j].data);
        //     log('imageList: $imageList');
        //   }*/
        //   imageList.addAll(getUserStoryModel.date[i].data);
        //   log('imageList: $imageList');
        //   // for(int j=0; getUserStoryModel.data[i].data.length; j++){
        //   //
        //   // }
        // }
        // log('0 Index: ${getUserStoryModel.date[0].data.length}');

      } else {
        log("User Story Api Else");
      }
    } catch (e) {
      log("Get All USer Story Api Error ::: $e");
    } /*finally {
      // isLoading(false);
      //await getUserStory();
      await getAllIncrementPetFunction();
    }*/

    log('storyOption1212 : $storyOption');
    if (storyOption == StoryOption.moveForward) {
      hasMore = true;
      pageIndex = 1;
      await getAllIncrementPetFunction();
    } else {
      isLoading(false);
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
      // if (imageFile != null) {
      log("uploading with a photo");
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var stream = http.ByteStream(imageFile!.openRead());
      stream.cast();

      var length = await imageFile!.length();

      request.files
          .add(await http.MultipartFile.fromPath("image", imageFile!.path));
      //request.headers.addAll(header);

      request.fields['userid'] = UserDetails.selfId;
      request.fields['categoryID'] = UserDetails.categoryId;

      // request.fields['name'] = "demo1";
      // request.fields['bod'] = "10-9-2014";
      // request.fields['phone'] = "1234567890";
      // request.fields['gender'] = "female";

      var multiPart = http.MultipartFile(
        'image',
        stream,
        length,
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
          Fluttertoast.showToast(msg: addUserStoryModel.message,fontSize: 12.sp);
          await getUserStory(storyOption: StoryOption.stay);
          Get.back();
        } else {
          log('False False');
        }
      });
      // }
      /*else {
        log("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        //request.headers.addAll(header);

        request.fields['userid'] = "${UserDetails.selfId}";
        request.fields['categoryID'] = "${UserDetails.categoryId}";

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
            Fluttertoast.showToast(msg: addUserStoryModel.message);
            await getUserStory(storyOption: StoryOption.stay);
            Get.back();
          } else {
            log('False False');
          }
        });
      }*/
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get User Profile
  Future<void> getUserProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetUserProfileModel getUserProfileModel =
          GetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(getUserProfileModel.data.petdata);

        userprofile.value = ApiUrl.apiImagePath +
            "asset/uploads/product/" +
            getUserProfileModel.data.data[0].image;
        userName = getUserProfileModel.data.data[0].name;
        log('userprofile12: $userprofile');
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await getAllBannerFunction();
    }
  }

  /// Get Shop Profile
  Future<void> getShopProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetShopProfileModel getShopProfileModel =
          GetShopProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getShopProfileModel.success.obs;

      if (isSuccessStatus.value) {
        shopPetList.clear();
        shopPetList.addAll(getShopProfileModel.data.petdata);

        shopProfile.value =
            ApiUrl.apiImagePath + getShopProfileModel.data.data[0].showimg;
        shopName = getShopProfileModel.data.data[0].shopename;
        shopDescription = getShopProfileModel.data.data[0].fullText;
        log('shopProfile: $shopProfile');

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await getAllBannerFunction();
    }
  }

  /// Get NGO Profile
  Future<void> getNgoProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      AllRoleProfileModel allRoleProfileModel =
          AllRoleProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRoleProfileModel.success.obs;

      if (isSuccessStatus.value) {
        ngoPetList.clear();
        ngoPetList.addAll(allRoleProfileModel.data.petdata);

        ngoProfile.value =
            ApiUrl.apiImagePath + allRoleProfileModel.data.data[0].image;
        ngoName = allRoleProfileModel.data.data[0].name;
        ngoDescription = allRoleProfileModel.data.data[0].fullText;

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
    }
    await getAllBannerFunction();
  }

  /// Get Trainer Profile
  Future<void> getTrainerProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetTrainersProfileModel getTrainersProfileModel =
          GetTrainersProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getTrainersProfileModel.success.obs;

      if (isSuccessStatus.value) {
        trainerPetList.clear();
        trainerPetList.addAll(getTrainersProfileModel.data.petdata);

        trainerProfile.value =
            ApiUrl.apiImagePath + getTrainersProfileModel.data.data[0].image;
        trainerName = getTrainersProfileModel.data.data[0].name;
        trainerDescription = getTrainersProfileModel.data.data[0].fullText;

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await getAllBannerFunction();
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    //getAllBannerFunction();
    initMethod();
    // getAllIncrementPetFunction();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        getAllIncrementPetFunction();
      }
    });
  }

  initMethod() async {
    if (UserDetails.categoryId == "1") {
      await getUserProfileFunction();
    } else if (UserDetails.categoryId == "2") {
      await getShopProfileFunction();
    } else if (UserDetails.categoryId == "3") {
      await getNgoProfileFunction();
    } else if (UserDetails.categoryId == "4") {
      await getTrainerProfileFunction();
    }
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/get_user_story_model/get_user_story_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';
import 'package:story_view/story_view.dart';

class StoryViewerController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  int index = Get.arguments;
  final storyController = StoryController();

  List<GetUserStoryModelDatum> userStoryList = [];
  List<DatumDatum> imageList = [];

  /// Get User Story
  Future<void> getUserStory() async {
    isLoading(true);
    String url = ApiUrl.getUserStoryApi + UserDetails.userId;
    log("Get User story Api Url : $url");

    try {
      // Map<String, String> header = apiHeader.apiHeader();
      // log("header : $header");

      http.Response response = await http.get(Uri.parse(url) /*headers: header*/);
      log("Get All USer Story Api response : ${response.body}");

      GetUserStoryModel getUserStoryModel =
      GetUserStoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserStoryModel.success.obs;

      if (isSuccessStatus.value) {
        // bannerList.clear();
        // for(int i=0; i< getUserStoryModel.data.length; i++){
        //   userStoryList.addAll(getUserStoryModel.data);
        //   log("userStoryList Length : ${userStoryList.length}");
        //   imageList.addAll(getUserStoryModel.data[i].data);
        //   log('imageList: $imageList');
        // }

        userStoryList.addAll(getUserStoryModel.data);
        log("userStoryList Length : ${userStoryList.length}");
        /*for(int i=0; i < getUserStoryModel.data.length; i++){
          imageList.addAll(getUserStoryModel.data[i].data);
          log('imageList: $imageList');
        }*/
        //for(int i=0; i < getUserStoryModel.data.length; i++) {
          /*for(int j=0; i < getUserStoryModel.data[i].data.length; j++){
            imageList.addAll(getUserStoryModel.data[j].data);
            log('imageList: $imageList');
          }*/
          imageList.addAll(getUserStoryModel.data[index].data);
          log('imageList: $imageList');
          // for(int j=0; getUserStoryModel.data[i].data.length; j++){
          //
          // }
       // }
        log('0 Index: ${getUserStoryModel.data[0].data.length}');

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserStory();
  }
}
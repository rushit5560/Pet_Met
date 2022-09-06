import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/get_user_story_model/get_user_story_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';
import 'package:story_view/story_view.dart';

class StoryViewerController extends GetxController {
  List<String> storyImagesList = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  final storyController = StoryController();

  List<GetUserStoryModelDatum> userStoryList = [];
  List<DatumDatum> imageList = [];

  /// Get User Story
  Future<void> getUserStory() async {
    isLoading(true);
    String url = ApiUrl.getUserStoryApi + UserDetails.selfId;
    log("Get User story Api Url : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url));
      log("Get All USer Story Api response : ${response.body}");

      GetUserStoryModel getUserStoryModel = GetUserStoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserStoryModel.success.obs;

      if (isSuccessStatus.value) {
        userStoryList.clear();

        /*for (int i = 0; i < getUserStoryModel.date[0].data.length; i++) {
          if (getUserStoryModel.date.data[i].data != []) {
            userStoryList.add(getUserStoryModel.data[i]);
          }
        }*/
        for(int i = 0; i < getUserStoryModel.date.length; i++){
          /*for(int j = 0; j < getUserStoryModel.date[i].data.length; j++){
            if (getUserStoryModel.date[i].data != []) {
              userStoryList.add(getUserStoryModel.date[i]);
            }
          }*/
          if (getUserStoryModel.date[i].data != []) {
            userStoryList.add(getUserStoryModel.date[i]);
          }
        }

        log("userStoryList Length : ${userStoryList.length}");

        // imageList.addAll(getUserStoryModel.data[index].data);
        // log('imageList: $imageList');

      } else {
        log("User Story Api Else");
      }
    } catch (e) {
      log("Get All USer Story Api Error ::: $e");
    } finally {
      isLoading(false);
      //await getUserStory();
    }
  }

}

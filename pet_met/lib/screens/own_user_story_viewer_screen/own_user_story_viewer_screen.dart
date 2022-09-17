import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/own_user_story_viewer_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:story_view/story_view.dart';

class OwnUserStoryViewerScreen extends StatelessWidget {
  OwnUserStoryViewerScreen({Key? key}) : super(key: key);
  final controller = Get.put(OwnUserStoryViewerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: StoryView(
            onStoryShow: (s) {
              log("Showing a story");
            },
            onComplete: () {
              log("Completed a cycle");
              Get.back();
            },
            progressPosition: ProgressPosition.top,
            repeat: false,
            controller: controller.storyController,
            onVerticalSwipeComplete: (direct) {
              // direct.index;
            },
            storyItems: [
              for (int i = 0; i < controller.ownUserStoryImagesList.length; i++)
                StoryItem.inlineImage(
                  imageFit: BoxFit.contain,
                  duration: const Duration(seconds: 10),
                  // caption: const Text(
                  //   "Caption Here",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       backgroundColor: Colors.black,
                  //       fontSize: 17),
                  // ),
                  url: ApiUrl.apiImagePath +
                      "asset/uploads/userstory/" +
                      controller.ownUserStoryImagesList[i].image,
                  controller: controller.storyController,
                ),
            ],

            //  [
            //   StoryItem.pageImage(
            //     // url:
            //     // "https://petomate.com/asset/uploads/petimage/bJkRk_destination_map_marker.png",
            //     url: imgUrl,
            //     controller: controller.storyController,
            //     duration: const Duration(seconds: 8),
            //   ),
            // ]
          ),
        ),

        // ListView.builder(
        //   itemCount: controller.ownUserStoryImagesList.length,
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context, i) {
        //     log('controller.storyImagesList.length: ${controller.ownUserStoryImagesList.length}');
        //     String imgUrl = ApiUrl.apiImagePath +
        //         "asset/uploads/userstory/" +
        //         controller.ownUserStoryImagesList[i].image;
        //     log("imgUrl : $imgUrl");

        //     return
        //   },
        // ),
      ),
    );
  }
}

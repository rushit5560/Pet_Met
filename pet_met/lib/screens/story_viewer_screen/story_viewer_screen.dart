import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/home_controller.dart';
import 'package:pet_met/controllers/story_viewer_controller.dart';
import 'package:story_view/story_view.dart';

class StoryViewerScreen extends StatelessWidget {
  StoryViewerScreen({Key? key}) : super(key: key);

  final controller = Get.put(StoryViewerController());



  @override
  Widget build(BuildContext context) {
    /*return Container(
      height: Get.height/2,
      width: Get.width,
      child: ListView.builder(
        itemCount: controller.imageList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return StoryView(
              onStoryShow: (s) {
                print("Showing a story");
              },
              onComplete: () {
                print("Completed a cycle");
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              controller: controller.storyController,
              storyItems:[
                StoryItem.pageImage(
                url: controller.imageList[index].image,
                //caption: "Still sampling",
                controller: controller.storyController,
              ),
              ]
          );
        },
      ),
    );*/

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: ListView.builder(
          itemCount: controller.userStoryList[controller.index].data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            log('controller.userStoryList[controller.index].data.length ${controller.userStoryList[controller.index].data.length}');
            log('controller.imageList: ${controller.imageList[controller.index].image}');
            return Container(
              height: Get.height,
              width: Get.width/2,
              child: StoryView(
                  onStoryShow: (s) {
                    log("Showing a story");
                  },
                  onComplete: () {
                    log("Completed a cycle");
                  },
                  progressPosition: ProgressPosition.top,
                  repeat: false,
                  controller: controller.storyController,
                  storyItems:[
                    StoryItem.pageImage(
                      url: controller.userStoryList[controller.index].data[index].image,
                      //caption: "Still sampling",
                      controller: controller.storyController,
                    ),
                  ]
              ),
            );
          },
        ),
      ),
    );
  }
}

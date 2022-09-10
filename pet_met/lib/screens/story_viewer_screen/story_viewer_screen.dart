import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/story_viewer_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

import '../../services/providers/dark_theme_provider.dart';

class StoryViewerScreen extends StatelessWidget {
  StoryViewerScreen({Key? key}) : super(key: key);

  final controller = Get.put(StoryViewerController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: ListView.builder(
          itemCount: controller.storyImagesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            log('controller.storyImagesList.length: ${controller.storyImagesList.length}');
            String imgUrl = ApiUrl.apiImagePath +
                "asset/uploads/userstory/" +
                controller.storyImagesList[i];
            log("imgUrl : $imgUrl");

            return SizedBox(
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
                  storyItems: [
                    StoryItem.pageImage(
                      // url:
                      //     "https://petomate.com/asset/uploads/petimage/bJkRk_destination_map_marker.png",
                      url: imgUrl,
                      controller: controller.storyController,
                      duration: const Duration(seconds: 8),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}

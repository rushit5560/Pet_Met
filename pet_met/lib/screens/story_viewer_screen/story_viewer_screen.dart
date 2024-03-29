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
          inline: true,
          controller: controller.storyController,
          onVerticalSwipeComplete: (direct) {
            if (direct == Direction.down) {
              Get.back();
            } else {
              log("direction : ${direct}");
            }
          },
          storyItems: [
            for (int i = 0; i < controller.storyImagesList.length; i++)
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
                    controller.storyImagesList[i],
                controller: controller.storyController,
              ),
          ],
        ),
      ),
    );
  }
}

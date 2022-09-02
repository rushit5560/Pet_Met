import 'package:get/get.dart';
import 'package:pet_met/models/get_user_story_model/get_user_story_model.dart';
import 'package:story_view/story_view.dart';

class OwnUserStoryViewerController extends GetxController{
  List<Userstory> ownUserStoryImagesList = Get.arguments;
  final storyController = StoryController();
}
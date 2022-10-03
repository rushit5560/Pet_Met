import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stories_editor/stories_editor.dart';



class EditStoryScreen extends StatefulWidget {
  const EditStoryScreen({Key? key}) : super(key: key);

  //final String filePath;

  @override
  State<EditStoryScreen> createState() => _EditStoryScreenState();
}

class _EditStoryScreenState extends State<EditStoryScreen> {


  @override
  Widget build(BuildContext context) {
    return StoriesEditor(
      giphyKey: '',

      /// (String) required param
      onDone: (String uri) {
        /// uri is the local path of final render Uint8List
        /// here your code
        log('URL: $uri');
      },


      // colorList: [],

      /// (List<Color>[]) optional param
      // gradientColors: [],

      /// (List<List<Color>>[]) optional param
      middleBottomWidget: Text("wjhfgh"),

      /// (Widget) optional param, you can add your own logo or text in the bottom tool
      // fontFamilyList: [],

      /// (List<String>) optional param
      // isCustomFontList: false,

      /// (bool) if you use a own font list set value to "true"
      onDoneButtonStyle: Container(),

      /// (Widget) optional param, you can create your own button style
      // onBackPress: ,/// (Future<bool>) optional param, here you can add yor own style dialog
      editorBackgroundColor: Colors.transparent,
      galleryThumbnailQuality: 100,

      // (Color) optional param, you can define your own background editor color
      /// (int = 200) optional param, you can set the gallery thumbnail quality (higher is better but reduce the performance)
    );
  }
}

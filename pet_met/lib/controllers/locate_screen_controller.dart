import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/user_chat_list_screen_model/user_chat_list_screen_model.dart';
import 'package:pet_met/utils/user_details.dart';

class LocateScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  /// Get User ChatRoom List
  Stream<List<UserChatRoomListModel>> getChatRoomListFunction() {
    // isLoading(true);
    String userEmail = UserDetails.userEmail;

    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("userEmails", arrayContains: userEmail)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          log("============================");
          log('doc: ${doc.data()}');
          var userchatDataList = UserChatRoomListModel.fromJson(
            doc.data(),
            //img,
          );

          return userchatDataList;
        }).toList());
  }
}
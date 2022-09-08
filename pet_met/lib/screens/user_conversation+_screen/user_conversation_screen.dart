import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_conversation_screen_controller.dart';
import 'package:pet_met/models/receive_message_model/receive_message_mdel.dart';
import 'package:pet_met/screens/user_conversation+_screen/user_conversation_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';

class UserConversationScreen extends StatelessWidget {
  UserConversationScreen({Key? key}) : super(key: key);

  final userConversationScreenController =
  Get.put(UserConversationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => userConversationScreenController.isLoading.value
            ? const CircularProgressIndicator()
            : SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                appBarOption: AppBarOption.singleBackButtonOption,
                title: userConversationScreenController.headerName,
              ),
              Expanded(
                child: StreamBuilder<List<ReceiveMessageModel>>(
                  stream: userConversationScreenController
                      .fetchChatFromFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                          "Something went wrong! ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      final chatList = snapshot.data;
                      log('chatList: ${chatList!.length}');
                      return ListView.builder(
                        itemCount: chatList.length,
                        reverse: true,
                        itemBuilder: (context, i) {
                          ReceiveMessageModel singleMsg = chatList[i];
                          // DocumentReference docRef= FirebaseFirestore.instance!.collection("Chats")!.get()!!;
                          return SingleMessageBubble(
                              singleMsg: singleMsg);
                        },
                      ).commonAllSidePadding(padding: 20);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              MessageWriteTextFieldModule(),
            ],
          ),
        ),
      ),
    );
  }
}

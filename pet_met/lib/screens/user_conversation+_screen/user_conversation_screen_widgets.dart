import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_conversation_screen_controller.dart';
import 'package:pet_met/models/receive_message_model/receive_message_mdel.dart';
import 'package:pet_met/models/receive_message_model/send_message_model.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/user_details.dart';

class SingleMessageBubble extends StatelessWidget {
  final ReceiveMessageModel singleMsg;

  SingleMessageBubble({Key? key, required this.singleMsg}) : super(key: key);
  final screenController = Get.find<UserConversationScreenController>();

  @override
  Widget build(BuildContext context) {
    bool isSendByMe;

    var msgSentDay = DateTime.fromMicrosecondsSinceEpoch(
        singleMsg.createdAt.microsecondsSinceEpoch)
        .toString()
        .split(" ")[0];
    var msgSentHourTime = DateTime.fromMicrosecondsSinceEpoch(
        singleMsg.createdAt.microsecondsSinceEpoch)
        .hour;
    var msgSentMinTime = DateTime.fromMicrosecondsSinceEpoch(
        singleMsg.createdAt.microsecondsSinceEpoch)
        .minute;

    singleMsg.senderId == UserDetails.userEmail
        ? isSendByMe = true
        : isSendByMe = false;
    return Container(
      margin: const EdgeInsets.all(5),
      padding: isSendByMe
          ? const EdgeInsets.only(left: 40)
          : const EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment:
            isSendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
            isSendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // if (isSendByMe == true) {
                  //   log("singleMsg.id : ${singleMsg.docId}");
                  //   showAlertDialog(context, singleMsg.docId);
                  // }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(15),
                      topLeft: const Radius.circular(15),
                      bottomRight: Radius.circular(isSendByMe ? 0 : 15),
                      bottomLeft: Radius.circular(isSendByMe ? 15 : 0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: isSendByMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        singleMsg.message,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "$msgSentDay at $msgSentHourTime:$msgSentMinTime",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageWriteTextFieldModule extends StatelessWidget {
  MessageWriteTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserConversationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColors.accentTextColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          cursorColor: Colors.grey,
          textInputAction: TextInputAction.done,
          controller: screenController.messageFieldController,
          // decoration: conversationScreenFieldDecoration(
          //   hintText: 'Type a message',
          //   controller: screenController,
          //   roomId: screenController.roomId,
          //   senderEmail: UserDetails.email,
          //   receiverEmail: screenController.receiverEmail,
          // ),
          decoration: InputDecoration(
            hintText: 'Type a message',
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.accentTextColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.accentTextColor),
            ),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: GestureDetector(
              onTap: () async {
                // controller.messageFieldController.clear();
                if (screenController.messageFieldController.text.isNotEmpty) {
                  /// Create Message Model Wise
                  SendMessageModel sendMsg = SendMessageModel(
                      roomId: screenController.roomId,
                      senderId: UserDetails.userEmail,
                      receiverId: screenController.receiverEmail,
                      message: screenController.messageFieldController.text,
                      createdAt: Timestamp.now(),
                      seen: false);

                  /// Insert this Msg in Current List
                  // controller.userChatList.insert(0, sendMsg);

                  /// Msg Store in Firebase
                  log('sendMsg: ${sendMsg.receiverId}');
                  await screenController.sendMessageFunction(sendMsg);
                }
              },
              // child: Image.asset(
              //   AppImages.sendImg,
              //   scale: 0.85,
              //   color: AppColors.blackColor,
              // ),
              child: Icon(Icons.send),
            ),
            /*prefixIcon: GestureDetector(
      onTap: () {},
      child: Image.asset(AppImages.emojiImg, scale: 0.75),
    ),*/
          ),
        ),
      ),
    );
  }
}
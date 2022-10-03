import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_conversation_screen_controller.dart';
import 'package:pet_met/models/receive_message_model/receive_message_mdel.dart';
import 'package:pet_met/models/receive_message_model/send_message_model.dart';
import 'package:pet_met/screens/address_screen/address_screen_widgets.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:provider/provider.dart';
import '../../services/providers/dark_theme_provider.dart';



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

    // String userName = UserDetails.roleId == 1 ? UserDetails.userEmail : UserDetails.shopName;

    singleMsg.sender == UserDetails.userEmail
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSendByMe
                        ? const Color(0xFF3AA5A3)
                        : themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.greyColor.withOpacity(0.75),
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
                        style: TextStyle(
                          fontSize: 13,
                          color: isSendByMe
                              ? AppColors.whiteColor
                              : themeProvider.darkTheme
                                  ? AppColors.blackTextColor
                                  : AppColors.whiteColor,
                        ),
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
    final DarkThemeProvider themeProvider =
        Provider.of<DarkThemeProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(25),
        //   topRight: Radius.circular(25),
        // ),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: TextFormField(
          cursorColor: themeProvider.darkTheme
              ? AppColors.whiteColor
              : AppColors.greyColor,
          textInputAction: TextInputAction.send,
          focusNode: screenController.msgFocusField,
          controller: screenController.messageFieldController,

          // decoration: conversationScreenFieldDecoration(
          //   hintText: 'Type a message',
          //   controller: screenController,
          //   roomId: screenController.roomId,
          //   senderEmail: UserDetails.email,
          //   receiverEmail: screenController.receiverEmail,
          // ),

          onEditingComplete: () async {
            if (screenController.messageFieldController.text.isNotEmpty) {
              String receiverEmail =
                  UserDetails.userEmail == screenController.userEmail
                      ? screenController.shopEmail
                      : UserDetails.userEmail;

              /// Create Message Model Wise
              SendMessageModel sendMsg = SendMessageModel(
                roomId: screenController.roomId,
                createdAt: Timestamp.now(),
                message: screenController.messageFieldController.text.trim(),
                user1seen: false,
                user2seen: false,
                sender: UserDetails.userEmail,
                receiver: receiverEmail,
              );

              /// Msg Store in Firebase
              log('sendMsg: ${sendMsg.receiver}');
              await screenController.sendMessageFunction(sendMsg);
              FocusScope.of(context)
                  .requestFocus(screenController.msgFocusField);
            }
          },
          decoration: InputDecoration(
            hintText: 'Type something...',
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            fillColor: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.greyTextColor.withOpacity(0.20),
            filled: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            suffixIcon: GestureDetector(
              onTap: () async {
                if (screenController.messageFieldController.text.isNotEmpty) {
                  String receiverEmail =
                      UserDetails.userEmail == screenController.userEmail
                          ? screenController.shopEmail
                          : UserDetails.userEmail;

                  /// Create Message Model Wise
                  SendMessageModel sendMsg = SendMessageModel(
                    roomId: screenController.roomId,
                    createdAt: Timestamp.now(),
                    message:
                        screenController.messageFieldController.text.trim(),
                    user1seen: false,
                    user2seen: false,
                    sender: UserDetails.userEmail,
                    receiver: receiverEmail,
                  );

                  /// Msg Store in Firebase
                  log('sendMsg: ${sendMsg.receiver}');
                  await screenController.sendMessageFunction(sendMsg);
                }
              },
              // child: Image.asset(
              //   AppImages.sendImg,
              //   scale: 0.85,
              //   color: AppColors.blackColor,
              // ),
              child: const Icon(
                Icons.send_rounded,
                color: AppColors.accentColor,
                size: 24,
              ),
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

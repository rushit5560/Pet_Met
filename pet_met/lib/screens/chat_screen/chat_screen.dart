import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_met/controllers/chat_screen_controller.dart';
import 'package:pet_met/models/user_chat_list_screen_model/user_chat_list_screen_model.dart';
import 'package:pet_met/screens/user_conversation_screen/user_conversation_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:provider/provider.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/loader.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatScreenController = Get.put(ChatScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background Module
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            BackGroundLeftShadow(
              height: chatScreenController.size.height * 0.3,
              width: chatScreenController.size.height * 0.3,
              topPad: chatScreenController.size.height * 0.28,
              leftPad: -chatScreenController.size.width * 0.15,
            ),

            // UI Module
            /*const Center(
              child: Text(
                "Coming Soon!",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
            /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.petActivityImg,
                  width: chatScreenController.size.width * 0.45,
                ),
                Text(
                  "Coming Soon!",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.accentTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )*/
            /* Stack(
              alignment: Alignment.center,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.20),
                          Colors.white.withOpacity(0.20),
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(
                      //   width: 1.5,
                      //   color: Colors.white.withOpacity(0.2),
                      // ),
                    ),
                    //child: child,
                  ),
                ),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.petActivityImg,
                      width: chatScreenController.size.width * 0.60,
                    ),
                    const Text(
                      "Coming Soon!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 28,
                        color: AppColors.accentTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )*/
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.none,
                  title: "Chat",
                ),
                Expanded(
                  child: Obx(
                    () => chatScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : StreamBuilder<List<UserChatRoomListModel>>(
                            stream:
                                chatScreenController.getChatRoomListFunction(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                    "Something went wrong! ${snapshot.error}");
                              } else if (snapshot.hasData) {
                                final chatList = snapshot.data;
                                log('chatList length: ${chatList!.length}');
                                return chatList.isEmpty
                                    ? Center(
                                        child: Text(
                                          "No chat data are available",
                                          style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.darkThemeColor),
                                        ),
                                      )
                                    : Scrollbar(
                                        child: RefreshIndicator(
                                          color: AppColors.accentColor,
                                          // backgroundColor: themeProvider.darkTheme ? AppColors.darkThemeBoxColor : AppColors.whiteColor ,
                                          triggerMode:
                                              RefreshIndicatorTriggerMode
                                                  .anywhere,
                                          onRefresh: () async {
                                            setState(() {});
                                            chatScreenController
                                                .getChatRoomListFunction();
                                          },
                                          child: ListView.builder(
                                            itemCount: chatList.length,
                                            shrinkWrap: true,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              UserChatRoomListModel singleMsg =
                                                  chatList[i];
                                              log('chatList.length: ${chatList.length}');
                                              return _chatListTile(
                                                  singleMsg, context);
                                            },
                                          ).commonAllSidePadding(padding: 15),
                                        ),
                                      );
                                // return ListView(
                                //   physics: const BouncingScrollPhysics(),
                                //   children: categories!.map((val) {
                                //     return categoryListTile(val).commonSymmetricPadding(horizontal: 8, vertical: 6);
                                //   }).toList(),
                                // ).commonAllSidePadding(padding: 15);
                              } else {
                                return const CustomAnimationLoader();
                              }
                            },
                          ),
                  ),
                  /*child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return _chatListTile();
                  },
                ).commonAllSidePadding(20),*/
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _chatListTile(UserChatRoomListModel singleMsg, BuildContext context) {
    String receiverName = UserDetails.userEmail == singleMsg.creatorEmail
        ? singleMsg.peerName
        : singleMsg.creatorName;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: GestureDetector(
        onTap: () {
          // String oppositeUserUniqueId = "";
          // if (UserDetails.roleName == "Customer") {
          //   oppositeUserUniqueId = singleMsg.vendorid!;
          // } else {
          //   oppositeUserUniqueId = singleMsg.customerid!;
          // }

          //readAllMessage(context, singleMsg, singleMsg.roomId!);
          // log('singleMsg.peerName: ${singleMsg.peerName}');
          //log('singleMsg.peerId: ${singleMsg.peerId}');
          // log('singleMsg.roomId: ${singleMsg.roomId}');
          Get.to(() => UserConversationScreen(), arguments: [
            singleMsg.chatRoomId,
            receiverName,
            UserDetails.roleId == 1
                ? singleMsg.peerName
                : singleMsg.creatorName,
            singleMsg.creatorEmail,
            singleMsg.peerEmail,
            // oppositeUserUniqueId,
            // singleMsg.customerid,
            // singleMsg.createdBy,
            // screenController.userChatList,
          ]);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: themeProvider.darkTheme
                    ? AppColors.greyColor.withOpacity(0.25)
                    : AppColors.greyColor.withOpacity(0.35),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Container(
                      //   height: 50,
                      //   width: 50,
                      //   decoration: const BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: Colors.transparent,
                      //   ),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(25),
                      //     child: Image.asset(AppImages.userProfileImg),
                      //   ),
                      // ),
                      /*SizedBox(
                        height: 50,
                        width: 50,
                        child: FutureBuilder<String>(
                          future: userChatListScreenController
                              .getUserChatImage(singleMsg.vendorid!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                padding: EdgeInsets.all(15),
                                child: CircularProgressIndicator(
                                  color: AppColors.accentColor,
                                  strokeWidth: 2,
                                ),
                              );
                            } else if (snapshot.hasData) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  ApiUrl.apiImagePath +
                                      snapshot.data.toString(),
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(AppImages.profileImg);
                                  },
                                ),
                              );
                            }

                            return Container(
                              padding: EdgeInsets.all(15),
                              child: CircularProgressIndicator(
                                color: AppColors.accentColor,
                                strokeWidth: 2,
                              ),
                            );
                          },
                        ),
                      ),*/
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              receiverName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor),
                            ),
                            // const SizedBox(height: 5),
                            // Text(
                            //   'Lorem Ipsum dummy Text for printing',
                            //   maxLines: 1,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(fontSize: 11),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.accentColor,
                  size: 24,
                ),

                /*FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Chats')
                      .where('room_id', isEqualTo: singleMsg.roomId)
                      .where('seen', isEqualTo: false)
                      .get(),
                  builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                    Widget widget = Container();

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox();
                    } else if (snapshot.hasData) {
                      var data = snapshot.data!.docs;

                      var msgCount = 0;

                      for (var element in data) {
                        Map usrData = element.data() as Map;
                        // print(usrData);
                        print("seen value is :  ${usrData["seen"]}");

                        if (usrData["seen"] == false) {
                          msgCount++;
                          widget = Container(
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                msgCount.toString(),
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    }
                    return widget;
                  },
                ),*/

                // newMessage(singleMsg)

                // const Text(
                //   '12:00 PM',
                //   style: TextStyle(fontSize: 11),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

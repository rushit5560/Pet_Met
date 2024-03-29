import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_details_screen_controller.dart';
import 'package:pet_met/firebase_database/firebase_database.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/user_details.dart';
import '../address_screen/address_screen_widgets.dart';
import '../user_conversation_screen/user_conversation_screen.dart';

class PetTrainerBannerImageModule extends StatelessWidget {
  PetTrainerBannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenController.size.width,
      height: screenController.size.height * 0.038.h,
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage(AppImages.shopDetailsImg),
      //   fit: BoxFit.cover,
      // ),
      // borderRadius: BorderRadius.circular(15),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          ApiUrl.apiImagePath + screenController.trainerDetails[0].image,
          fit: BoxFit.fill,
          errorBuilder: (context, er, ob) {
            return Image.asset(AppImages.petMetLogoImg);
          },
        ),
      ),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class PetTrainerPicturesModule extends StatelessWidget {
  PetTrainerPicturesModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Trainer Picture",
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // screenController.isVerified == true
                //     ? Image.asset(
                //         AppIcons.verifiedSymbolImg,
                //         width: 25,
                //         height: 25,
                //       )
                //     : Container(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          screenController.trainerDetails[0].image1 == "" &&
                  screenController.trainerDetails[0].image2 == "" &&
                  screenController.trainerDetails[0].image3 == "" &&
                  screenController.trainerDetails[0].image4 == "" &&
                  screenController.trainerDetails[0].image5 == ""
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "No pictures available!",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor.withOpacity(0.4)
                          : AppColors.blackTextColor,
                      fontSize: 10.sp,
                    ),
                  ),
                )
              : Row(
                  children: [
                    screenController.trainerDetails[0].image1 == ""
                        ? Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        : Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                imageAlertDialog(context, index = 1);
                              },
                              child: SizedBox(
                                height: screenController.size.width * 0.18,
                                //width: screenController.size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey)),
                                  // padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        ApiUrl.apiImagePath +
                                            "asset/uploads/product/"
                                                "${screenController.trainerDetails[0].image1}",
                                        height: 40,
                                        width: 40,
                                        errorBuilder: (context, er, da) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.asset(
                                            AppImages.petMetLogoImg),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            )),
                    screenController.trainerDetails[0].image1 == ""
                        ? Container()
                        : const SizedBox(width: 10),
                    screenController.trainerDetails[0].image2 == ""
                        ? Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        : Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                imageAlertDialog(context, index = 2);
                              },
                              child: SizedBox(
                                height: screenController.size.width * 0.18,
                                //width: screenController.size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey)),
                                  // padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        ApiUrl.apiImagePath +
                                            "asset/uploads/product/"
                                                "${screenController.trainerDetails[0].image2}",
                                        height: 40,
                                        width: 40,
                                        errorBuilder: (context, er, da) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.asset(
                                            AppImages.petMetLogoImg),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            )),
                    screenController.trainerDetails[0].image2 == ""
                        ? Container()
                        : const SizedBox(width: 10),
                    screenController.trainerDetails[0].image3 == ""
                        ? Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        : Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                imageAlertDialog(context, index = 3);
                              },
                              child: SizedBox(
                                height: screenController.size.width * 0.18,
                                //width: screenController.size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey)),
                                  // padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        ApiUrl.apiImagePath +
                                            "asset/uploads/product/"
                                                "${screenController.trainerDetails[0].image3}",
                                        fit: BoxFit.cover,
                                        height: 40,
                                        width: 40,
                                        errorBuilder: (context, er, da) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.asset(
                                            AppImages.petMetLogoImg),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            )),
                    screenController.trainerDetails[0].image3 == ""
                        ? Container()
                        : const SizedBox(width: 10),
                    screenController.trainerDetails[0].image4 == ""
                        ? Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        : Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                imageAlertDialog(context, index = 4);
                              },
                              child: SizedBox(
                                height: screenController.size.width * 0.18,
                                //width: screenController.size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey)),
                                  // padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        ApiUrl.apiImagePath +
                                            "asset/uploads/product/"
                                                "${screenController.trainerDetails[0].image4}",
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, er, da) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.asset(
                                            AppImages.petMetLogoImg),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            )),
                    screenController.trainerDetails[0].image4 == ""
                        ? Container()
                        : const SizedBox(width: 10),
                    screenController.trainerDetails[0].image5 == ""
                        ? Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        : Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                imageAlertDialog(context, index = 5);
                              },
                              child: SizedBox(
                                height: screenController.size.width * 0.18,
                                //width: screenController.size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey)),
                                  // padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        ApiUrl.apiImagePath +
                                            "asset/uploads/product/"
                                                "${screenController.trainerDetails[0].image5}",
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, er, da) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.asset(
                                            AppImages.petMetLogoImg),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            )),
                  ],
                ),
        ],
      ),
    );
  }

  imageAlertDialog(BuildContext context, index) {
    Widget cancelButton = TextButton(
      child: Text(
        "No, cancel",
        style: TextStyle(fontSize: 8.sp),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Yes, delete it",
        style: TextStyle(fontSize: 8.sp),
      ),
      onPressed: () async {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: index == 1
          ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.trainerDetails[0].image1,
              fit: BoxFit.cover, errorBuilder: (context, er, da) {
              return Image.asset(AppImages.petMetLogoImg);
            })
          : index == 2
              ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.trainerDetails[0].image2,
                  fit: BoxFit.cover, errorBuilder: (context, er, da) {
                  return Image.asset(AppImages.petMetLogoImg);
                })
              : index == 3
                  ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.trainerDetails[0].image3,
                      fit: BoxFit.cover, errorBuilder: (context, er, da) {
                      return Image.asset(AppImages.petMetLogoImg);
                    })
                  : index == 4
                      ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.trainerDetails[0].image4,
                          fit: BoxFit.cover, errorBuilder: (context, er, da) {
                          return Image.asset(AppImages.petMetLogoImg);
                        })
                      : index == 5
                          ? Image.network(
                              ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.trainerDetails[0].image5,
                              fit: BoxFit.cover, errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            })
                          : Container(),
      //Image.asset(AppImages.petMetLogoImg)
      // content: Text(
      //     "If you change timing slot duration your all schedule slot should been deleted you won't be able to recover this again!"),
      // actions: [
      //   continueButton,
      //   cancelButton,
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class PetTrainerNameAndSocialMediaButtonModule extends StatelessWidget {
  PetTrainerNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                screenController.trainerDetails[0].displayName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              screenController.isVerified == true
                  ? Image.asset(
                      AppIcons.verifiedSymbolImg,
                      width: 3.5.h,
                      height: 3.5.h,
                    )
                  : Container(),
            ],
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     String url = screenController.trainerDetails[0].instagram;
        //     if(url.isEmpty){
        //       Fluttertoast.showToast(msg: 'Instagram URL is not added. Please add URL!!!');
        //     }  else {
        //       _makingInstagramApp(url);
        //     }
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.instaImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     var fbUrl = screenController.trainerDetails[0].facebook;
        //     if(fbUrl.isEmpty){
        //       Fluttertoast.showToast(msg: 'Facebook URL is not added. Please add URL!!!');
        //     } else {
        //       launchFacebook(fbUrl, fbUrl);
        //     }
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.fbImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     String number = "${screenController.trainerDetails[0].phone}";
        //     launchWhatsApp(context, number);
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.whatsappImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        GestureDetector(
          onTap: () {
            String number = "${screenController.trainerDetails[0].phone}";
            _makingPhoneCall(number);
          },
          child: Container(
            // height: screenController.size.width * 0.018.w,
            // width: screenController.size.width * 0.018.w,
            height: 4.h,
            width: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.phoneCallImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: () async {
            final FirebaseDatabase firebaseDatabase = FirebaseDatabase();

            if (UserDetails.userEmail == screenController.trainerEmail) {
              Fluttertoast.showToast(msg: "User can't chat with itself.");
            } else {
              List<String> tempChatRoomIdList = [];

              screenController.trainerCatId = "4";

              // CharRoom Id Generate
              String chatRoomId =
                  "${UserDetails.selfId}${UserDetails.categoryId}_${screenController.trainerId}${screenController.trainerCatId}";
              String chatRoomId2 =
                  "${screenController.trainerId}${screenController.trainerCatId}_${UserDetails.selfId}${UserDetails.categoryId}";

              // Get All Chat Room From Firebase
              QuerySnapshot querySnapshot =
                  await FirebaseFirestore.instance.collection("ChatRoom").get();

              querySnapshot.docs.map((doc) {
                doc.data();

                if (doc['chatRoomId'].toString().contains(chatRoomId)) {
                  log("first if stat");
                  tempChatRoomIdList.add(doc['chatRoomId']);
                }
                if (doc['chatRoomId'].toString().contains(chatRoomId2)) {
                  log("second if stat");
                  tempChatRoomIdList.add(doc['chatRoomId']);
                }
              }).toList();

              log("tempChatRoomId : $tempChatRoomIdList");

              if (tempChatRoomIdList.isEmpty) {
                /// Create chat room
                Timestamp timeStamp = Timestamp.now();
                // CharRoom Id Generate
                // String charRoomId =
                //     "${UserDetails.selfId}${UserDetails.categoryId}_${controller.chatUid}${controller.chatCategoryId}";

                log("ooppo Userid : ${screenController.trainerId}");
                log("oppo user CategoryId : ${screenController.trainerCatId}");
                log("charRoomId123 : $chatRoomId");

                // ChatRoom Data
                Map<String, dynamic> chatRoomData = {
                  "chatRoomId": chatRoomId,
                  "creator": "${UserDetails.selfId}${UserDetails.categoryId}",
                  "pearer":
                      "${screenController.trainerId}${screenController.trainerCatId}",
                  "creatorEmail": UserDetails.userEmail,
                  "peerEmail": screenController.trainerEmail,
                  "creatorName": UserDetails.userName,
                  "peerName": screenController.trainerName,
                  "createdAt": timeStamp,
                  "userEmails": [
                    UserDetails.userEmail,
                    screenController.trainerEmail,
                  ],
                };

                log("chatRoomData : $chatRoomData");

                // Create ChatRoom Function
                firebaseDatabase.createChatRoomOfTwoUsers(
                    chatRoomId, chatRoomData);
                //Go to conversation screen
                Get.to(
                  () => UserConversationScreen(),
                  arguments: [
                    chatRoomId,
                    screenController.trainerName,
                    screenController.trainerName,
                    UserDetails.userEmail,
                    screenController.trainerEmail,
                  ],
                );
              } else {
                if (tempChatRoomIdList[0].contains(chatRoomId)) {
                  /// Create chat room
                  Timestamp timeStamp = Timestamp.now();

                  log("chatUid : ${screenController.trainerId}");
                  log("chatCategoryId : ${screenController.trainerCatId}");
                  log("charRoomId1 : $chatRoomId");

                  // ChatRoom Data
                  Map<String, dynamic> chatRoomData = {
                    "chatRoomId": chatRoomId,
                    "creator": "${UserDetails.selfId}${UserDetails.categoryId}",
                    "pearer":
                        "${screenController.trainerId}${screenController.trainerCatId}",
                    "creatorEmail": UserDetails.userEmail,
                    "peerEmail": screenController.trainerEmail,
                    "creatorName": UserDetails.userName,
                    "peerName": screenController.trainerName,
                    "createdAt": timeStamp,
                    "userEmails": [
                      UserDetails.userEmail,
                      screenController.trainerEmail,
                    ],
                  };

                  log("chatRoomData : $chatRoomData");

                  // Create ChatRoom Function
                  firebaseDatabase.createChatRoomOfTwoUsers(
                      chatRoomId, chatRoomData);
                  //Go to conversation screen
                  Get.to(
                    () => UserConversationScreen(),
                    arguments: [
                      chatRoomId,
                      screenController.trainerName,
                      screenController.trainerName,
                      UserDetails.userEmail,
                      screenController.trainerEmail,
                    ],
                  );
                } else {
                  /// Create chat room
                  Timestamp timeStamp = Timestamp.now();

                  log("screenController.chatUid : ${screenController.trainerId}");
                  log("screenController.chatCategoryId : ${screenController.trainerCatId}");
                  log("charRoomId123 : $chatRoomId2");

                  // ChatRoom Data
                  Map<String, dynamic> chatRoomData = {
                    "chatRoomId": chatRoomId,
                    "creator":
                        "${screenController.trainerId}${screenController.trainerCatId}",
                    "pearer": " ${UserDetails.selfId}${UserDetails.categoryId}",
                    "creatorEmail": screenController.trainerEmail,
                    "peerEmail": UserDetails.userEmail,
                    "creatorName": screenController.trainerName,
                    "peerName": UserDetails.userName,
                    "createdAt": timeStamp,
                    "userEmails": [
                      screenController.trainerEmail,
                      UserDetails.userEmail,
                    ],
                  };

                  log("chatRoomData : $chatRoomData");

                  // Create ChatRoom Function
                  firebaseDatabase.createChatRoomOfTwoUsers(
                      chatRoomId2, chatRoomData);
                  //Go to conversation screen
                  Get.to(
                    () => UserConversationScreen(),
                    arguments: [
                      chatRoomId2,
                      screenController.trainerName,
                      screenController.trainerName,
                      UserDetails.userEmail,
                      screenController.trainerEmail,
                    ],
                  );
                }

                //Go to conversation screen
                Get.to(
                  () => UserConversationScreen(),
                  arguments: [
                    chatRoomId.isEmpty ? chatRoomId2 : chatRoomId,
                    screenController.trainerName,
                    screenController.trainerName,
                    UserDetails.userEmail,
                    screenController.trainerEmail,
                  ],
                );
              }
            }
          },
          child: Container(
            // height: screenController.size.width * 0.018.w,
            // width: screenController.size.width * 0.018.w,
            height: 4.h,
            width: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppIcons.messageImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  _makingPhoneCall(String number) async {
    var url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsApp(BuildContext context, String number) {
    FocusManager.instance.primaryFocus?.unfocus();

    var whatsappUrl = "whatsapp://send?phone=$number"
        "&text=${Uri.encodeComponent("Hello")}";
    try {
      launch(whatsappUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Unable to open whatsapp"),
        ),
      );
      Fluttertoast.showToast(msg: "Unable to open whatsapp");
    }
  }

  Future<void> launchFacebook(String fbUrl, String fbWebUrl) async {
    try {
      bool launched = await launch(fbUrl, forceSafariVC: false);
      log("Launched Native app $launched");

      if (!launched) {
        await launch(fbWebUrl, forceSafariVC: false);
        log("Launched browser $launched");
      }
    } catch (e) {
      await launch(fbWebUrl, forceSafariVC: false);
      log("Inside catch");
    }
  }

  _makingInstagramApp(String url) async {
    // var url = 'https://www.instagram.com/<INSTAGRAM_PROFILE>/';

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }
}

class PetTrainerPlaceTimePaymentModule extends StatelessWidget {
  PetTrainerPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        // Shop Address Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.locationImg,
              height: 2.8.h,
              width: 2.8.h,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                screenController.trainerDetails[0].address,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Shop Time Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Image.asset(
              AppIcons.clockImg,
              height: 20,
              width: 20,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),*/
            Icon(
              Icons.watch_later_outlined,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              size: 2.8.h,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Open: " + screenController.trainerDetails[0].open,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                      fontSize: 10.sp,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Close: " + screenController.trainerDetails[0].close,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class CallUsTextModule extends StatelessWidget {
  CallUsTextModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Text(
        "Call Us Today at " +
            "${screenController.trainerDetails[0].phone}" +
            " To Learn More!",
        style: const TextStyle(
          color: AppColors.accentTextColor,
          fontWeight: FontWeight.bold,
        )).commonSymmetricPadding(horizontal: 15);
  }
}

class PetTrainerOverViewModule extends StatelessWidget {
  PetTrainerOverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Overview",
          style: TextStyle(
            color: AppColors.accentTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: screenController.size.height * 0.003.h),
        Html(
          data: screenController.trainerDetails[0].fullText,
          style: {
            "p": Style(
              fontSize: FontSize(10.sp),
              fontWeight: FontWeight.bold,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
            "body": Style(
              fontSize: FontSize(10.sp),
              fontWeight: FontWeight.bold,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
          },
        ),
        // Text(
        //   screenController.trainerDetails[0].fullText!,
        //   style: TextStyle(
        //     color: themeProvider.darkTheme
        //         ? AppColors.whiteColor
        //         : AppColors.blackTextColor,
        //   ),
        // ),
        SizedBox(height: screenController.size.height * 0.003.h),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class PayButtonModule extends StatelessWidget {
  PayButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetTrainersDetailsScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () async {
          // screenController.openCheckout(price: int.parse(screenController.priceController.text));
          // Fluttertoast.showToast(msg: 'Processing payment to trainer.');
          if (screenController.trainerName == UserDetails.userName) {
            Fluttertoast.showToast(msg: "Trainer can't pay to itself.");
          } else {
            alertDialogBox(context);
          }
        },
        child: Container(
          width: double.infinity,
          // height: 50,
          decoration: const BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              "Pay",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).commonSymmetricPadding(vertical: 10),
        ),
      ),
    );
  }

  alertDialogBox(BuildContext context) {
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor.withOpacity(0.3)
          : AppColors.accentColor.withOpacity(0.3),
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkThemeBoxColor
            : AppColors.whiteColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          height: screenController.size.height * 0.35,
          width: screenController.size.width * 0.8,
          child: Form(
            key: screenController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Trainer Charge",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Please Enter Amount",
                //       style: TextStyle(
                //         color: themeProvider.darkTheme
                //             ? AppColors.whiteColor
                //             : AppColors.blackTextColor,
                //         fontSize: 11.sp,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 8),
                // CustomLightTextField(
                //   readOnly: false,
                //   fieldController: controller.passwordController,
                //   height: Get.height * 0.05,
                //   width: double.infinity,
                //   hintText: "Password",
                //   textInputAction: TextInputAction.next,
                //   textInputType: TextInputType.text,
                //   validator: (val) => Validations().validateName(val!),
                // ),

                Stack(
                  children: [
                    Container(
                      height: screenController.size.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor.withOpacity(0.05)
                                : AppColors.greyTextColor.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: screenController.priceController,
                      validator: (val) => Validations().validatePrice(val!),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      cursorColor: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.accentTextColor,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                        fillColor: themeProvider.darkTheme
                            ? AppColors.darkThemeBoxColor
                            : AppColors.whiteColor,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                        hintText: "Enter Amount",
                        hintStyle: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.greyTextColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //await screenController.userLoginFunction();
                        if (screenController.formKey.currentState!.validate()) {
                          Get.back();
                          screenController.openCheckout(
                              price: int.parse(
                                  screenController.priceController.text));
                        }
                      },
                      child: Container(
                        //width: double.infinity,
                        // height: 35,
                        decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenController.size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        //width: double.infinity,
                        // height: 35,
                        decoration: const BoxDecoration(
                          color: AppColors.greyTextColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

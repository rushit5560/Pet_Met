import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
import 'package:pet_met/screens/user_profile_screen/widgets/user_profile_screen_widgets.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../firebase_database/firebase_database.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/user_details.dart';
import '../user_conversation_screen/user_conversation_screen.dart';

class BannerImageModule extends StatelessWidget {
  BannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenController.size.width,
      height: screenController.size.height * 0.038.h,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(AppImages.shopDetailsImg),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.network(
        ApiUrl.apiImagePath +
            "asset/uploads/product/" +
            screenController.vetsNgoDetailsData[0].image!,
        errorBuilder: (context, st, ob) {
          return Image.asset(AppImages.petMetLogoImg);
        },
        fit: BoxFit.cover,
      ),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class NgoAchivementPictureListModule extends StatelessWidget {
  NgoAchivementPictureListModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Vet & Ngo Pet Picture",
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
          const SizedBox(height: 7),
          Row(
            children: [
              screenController.vetsNgoDetailsData[0].image1 == null
                  ? Container()
                  : Expanded(
                      child: GestureDetector(
                      onTap: () {
                        imageAlertDialog(context, index = 1);
                      },
                      child: SizedBox(
                        height: screenController.size.width * 0.16,
                        //width: screenController.size.width * 0.18,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          //padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                ApiUrl.apiImagePath +
                                    "asset/uploads/product/"
                                        "${screenController.vetsNgoDetailsData[0].image1}",
                                fit: BoxFit.fill,
                                // height: 40,
                                // width: 40,
                                errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                          ),
                        ),
                      ),
                    )),
              screenController.vetsNgoDetailsData[0].image1 == null
                  ? Container()
                  : SizedBox(width: 10),
              screenController.vetsNgoDetailsData[0].image2 == null
                  ? Container()
                  : Expanded(
                      child: GestureDetector(
                      onTap: () {
                        imageAlertDialog(context, index = 2);
                      },
                      child: SizedBox(
                        height: screenController.size.width * 0.16,
                        //width: screenController.size.width * 0.18,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                ApiUrl.apiImagePath +
                                    "asset/uploads/product/"
                                        "${screenController.vetsNgoDetailsData[0].image2}",
                                height: 40,
                                width: 40, errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                          ),
                        ),
                      ),
                    )),
              screenController.vetsNgoDetailsData[0].image2 == null
                  ? Container()
                  : SizedBox(width: 10),
              screenController.vetsNgoDetailsData[0].image3 == null
                  ? Container()
                  : Expanded(
                      child: GestureDetector(
                      onTap: () {
                        imageAlertDialog(context, index = 3);
                      },
                      child: SizedBox(
                        height: screenController.size.width * 0.16,
                        //width: screenController.size.width * 0.18,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                ApiUrl.apiImagePath +
                                    "asset/uploads/product/"
                                        "${screenController.vetsNgoDetailsData[0].image3}",
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40, errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                          ),
                        ),
                      ),
                    )),
              screenController.vetsNgoDetailsData[0].image3 == null
                  ? Container()
                  : SizedBox(width: 10),
              screenController.vetsNgoDetailsData[0].image4 == null
                  ? Container()
                  : Expanded(
                      child: GestureDetector(
                      onTap: () {
                        imageAlertDialog(context, index = 4);
                      },
                      child: SizedBox(
                        height: screenController.size.width * 0.16,
                        //width: screenController.size.width * 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                ApiUrl.apiImagePath +
                                    "asset/uploads/product/"
                                        "${screenController.vetsNgoDetailsData[0].image4}",
                                fit: BoxFit.cover,
                                errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                          ),
                        ),
                      ),
                    )),
              screenController.vetsNgoDetailsData[0].image4 == null
                  ? Container()
                  : SizedBox(width: 10),
              screenController.vetsNgoDetailsData[0].image5 == null
                  ? Container()
                  : Expanded(
                      child: GestureDetector(
                      onTap: () {
                        imageAlertDialog(context, index = 5);
                      },
                      child: SizedBox(
                        height: screenController.size.width * 0.16,
                        //width: screenController.size.width * 0.18,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                ApiUrl.apiImagePath +
                                    "asset/uploads/product/"
                                        "${screenController.vetsNgoDetailsData[0].image5}",
                                fit: BoxFit.cover,
                                errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                          ),
                        ),
                      ),
                    ))
            ],
          )
        ],
      ),
    );
  }

  imageAlertDialog(BuildContext context, index) {
    Widget cancelButton = TextButton(
      child: Text("No, cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes, delete it"),
      onPressed: () async {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: index == 1
          ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.vetsNgoDetailsData[0].image1!,
              fit: BoxFit.cover, errorBuilder: (context, er, da) {
              return Image.asset(AppImages.petMetLogoImg);
            })
          : index == 2
              ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.vetsNgoDetailsData[0].image2!,
                  fit: BoxFit.cover, errorBuilder: (context, er, da) {
                  return Image.asset(AppImages.petMetLogoImg);
                })
              : index == 3
                  ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.vetsNgoDetailsData[0].image3!,
                      fit: BoxFit.cover, errorBuilder: (context, er, da) {
                      return Image.asset(AppImages.petMetLogoImg);
                    })
                  : index == 4
                      ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.vetsNgoDetailsData[0].image4!,
                          fit: BoxFit.cover, errorBuilder: (context, er, da) {
                          return Image.asset(AppImages.petMetLogoImg);
                        })
                      : index == 5
                          ? Image.network(
                              ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.vetsNgoDetailsData[0].image5!,
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

class VetAndNgoNameAndSocialMediaButtonModule extends StatelessWidget {
  VetAndNgoNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                screenController.vetsNgoDetailsData[0].name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.accentTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              screenController.isVerified == true
                  ? Image.asset(
                      AppIcons.verifiedSymbolImg,
                      width: 25,
                      height: 25,
                    )
                  : Container(),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (screenController.vetsNgoDetailsData[0].instagram == "") {
              Fluttertoast.showToast(msg: "Instagram link is not available!");
            } else {
              String url =
                  "${screenController.vetsNgoDetailsData[0].instagram}";
              _makingInstagramApp(url);
            }
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.instaImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: () {
            if (screenController.vetsNgoDetailsData[0].facebook == "") {
              Fluttertoast.showToast(msg: "Facebook link is not available!");
            } else {
              var fbUrl = "${screenController.vetsNgoDetailsData[0].facebook}";
              launchFacebook(fbUrl, fbUrl);
            }
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.fbImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        // GestureDetector(
        //   onTap: () {
        //     String number = "${screenController.vetsNgoDetailsData[0].phone}";
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
            if (screenController.vetsNgoDetailsData[0].phone == "") {
              Fluttertoast.showToast(msg: "Number Not Available");
            } else {
              String number = "${screenController.vetsNgoDetailsData[0].phone}";
              _makingPhoneCall(number);
            }
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.phoneCallImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: () async {
            final FirebaseDatabase firebaseDatabase = FirebaseDatabase();

            if (UserDetails.userEmail == screenController.vetAndNgoEmail) {
              Fluttertoast.showToast(msg: "User can't chat with itself.");
            } else {
              List<String> tempChatRoomIdList = [];

              screenController.vetAndNgoCatId = "3";

              // CharRoom Id Generate
              String chatRoomId =
                  "${UserDetails.selfId}${UserDetails.categoryId}_${screenController.vetAndNgoId}${screenController.vetAndNgoCatId}";
              String chatRoomId2 =
                  "${screenController.vetAndNgoId}${screenController.vetAndNgoCatId}_${UserDetails.selfId}${UserDetails.categoryId}";

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

                log("ooppo Userid : ${screenController.vetAndNgoId}");
                log("oppo user CategoryId : ${screenController.vetAndNgoCatId}");
                log("charRoomId123 : $chatRoomId");

                // ChatRoom Data
                Map<String, dynamic> chatRoomData = {
                  "chatRoomId": chatRoomId,
                  "creator": "${UserDetails.selfId}${UserDetails.categoryId}",
                  "pearer":
                      "${screenController.vetAndNgoId}${screenController.vetAndNgoCatId}",
                  "creatorEmail": UserDetails.userEmail,
                  "peerEmail": screenController.vetAndNgoEmail,
                  "creatorName": UserDetails.userName,
                  "peerName": screenController.vetAndNgoName,
                  "createdAt": timeStamp,
                  "userEmails": [
                    UserDetails.userEmail,
                    screenController.vetAndNgoEmail,
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
                    screenController.vetAndNgoName,
                    screenController.vetAndNgoName,
                    UserDetails.userEmail,
                    screenController.vetAndNgoEmail,
                  ],
                );
              } else {
                if (tempChatRoomIdList[0].contains(chatRoomId)) {
                  /// Create chat room
                  Timestamp timeStamp = Timestamp.now();

                  log("chatUid : ${screenController.vetAndNgoId}");
                  log("chatCategoryId : ${screenController.vetAndNgoCatId}");
                  log("charRoomId1 : $chatRoomId");

                  // ChatRoom Data
                  Map<String, dynamic> chatRoomData = {
                    "chatRoomId": chatRoomId,
                    "creator": "${UserDetails.selfId}${UserDetails.categoryId}",
                    "pearer":
                        "${screenController.vetAndNgoId}${screenController.vetAndNgoCatId}",
                    "creatorEmail": UserDetails.userEmail,
                    "peerEmail": screenController.vetAndNgoEmail,
                    "creatorName": UserDetails.userName,
                    "peerName": screenController.vetAndNgoName,
                    "createdAt": timeStamp,
                    "userEmails": [
                      UserDetails.userEmail,
                      screenController.vetAndNgoEmail,
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
                      screenController.vetAndNgoName,
                      screenController.vetAndNgoName,
                      UserDetails.userEmail,
                      screenController.vetAndNgoEmail,
                    ],
                  );
                } else {
                  /// Create chat room
                  Timestamp timeStamp = Timestamp.now();

                  log("screenController.chatUid : ${screenController.vetAndNgoId}");
                  log("screenController.chatCategoryId : ${screenController.vetAndNgoCatId}");
                  log("charRoomId123 : $chatRoomId2");

                  // ChatRoom Data
                  Map<String, dynamic> chatRoomData = {
                    "chatRoomId": chatRoomId,
                    "creator":
                        "${screenController.vetAndNgoId}${screenController.vetAndNgoCatId}",
                    "pearer": " ${UserDetails.selfId}${UserDetails.categoryId}",
                    "creatorEmail": screenController.vetAndNgoEmail,
                    "peerEmail": UserDetails.userEmail,
                    "creatorName": screenController.vetAndNgoName,
                    "peerName": UserDetails.userName,
                    "createdAt": timeStamp,
                    "userEmails": [
                      screenController.vetAndNgoEmail,
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
                      screenController.vetAndNgoName,
                      screenController.vetAndNgoName,
                      UserDetails.userEmail,
                      screenController.vetAndNgoEmail,
                    ],
                  );
                }

                //Go to conversation screen
                Get.to(
                  () => UserConversationScreen(),
                  arguments: [
                    chatRoomId.isEmpty ? chatRoomId2 : chatRoomId,
                    screenController.vetAndNgoName,
                    screenController.vetAndNgoName,
                    UserDetails.userEmail,
                    screenController.vetAndNgoEmail,
                  ],
                );
              }
            }
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
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
      Fluttertoast.showToast(msg: "Contact number is not available!");
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
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("Unable to open whatsapp"),
      //   ),
      // );
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
      Fluttertoast.showToast(msg: "Facebook link is not available!");
      await launch(fbWebUrl, forceSafariVC: false);
      log("Inside catch");
    }
  }

  _makingInstagramApp(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.platformDefault,
        // universalLinksOnly: true,
      );
    } else {
      Fluttertoast.showToast(msg: "Instagram link is not available!");
      throw 'There was a problem to open the url: $url';
    }
  }
}

class VetAndNgoPlaceTimePaymentModule extends StatelessWidget {
  VetAndNgoPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shop Address Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.locationImg,
              height: 20,
              width: 20,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                screenController.vetsNgoDetailsData[0].address!,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenController.size.height * 0.002.h),

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
                  : AppColors.greyTextColor,
              size: 20,
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                "Opens : " +
                    screenController.vetsNgoDetailsData[0].open! +
                    "  "
                        "Closes :" +
                    screenController.vetsNgoDetailsData[0].close!,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

// ignore: must_be_immutable
class DonateForPetLoversButtonModule extends StatelessWidget {
  DonateForPetLoversButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.vetAndNgoName == UserDetails.userName) {
          Fluttertoast.showToast(msg: "Vet & Ngo can't pay to itself.");
        } else {
          alertDialogBox(context);
        }
      },
      child: Container(
        // width: Get.width / 1.5,
        height: 35,
        decoration: const BoxDecoration(
          color: AppColors.accentTextColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Click to Pay",
              style: TextStyle(
                color: AppColors
                    .whiteColor /*themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.darkThemeColor*/
                ,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.favorite_rounded,
              color: AppColors
                  .whiteColor /*themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.darkThemeColor*/
              ,
              size: 18,
            ),
          ],
        ).commonSymmetricPadding(horizontal: 20),
      ),
    ).commonSymmetricPadding(horizontal: 25);
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
          height: screenController.size.height * 0.3,
          width: screenController.size.width * 0.8,
          child: Form(
            key: screenController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please Enter Amount",
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                        hintText: "Amount",
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
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        //await screenController.userLoginFunction();
                        if (screenController.formKey.currentState!.validate()) {
                          Get.back();
                          screenController.openCheckout(
                              price: int.parse(
                                  screenController.priceController.text));
                          screenController.priceController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.accentColor,
                        minimumSize: Size(
                          screenController.size.width * 0.3,
                          30,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenController.size.width * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.greyTextColor.withOpacity(0.3),
                        minimumSize:
                            Size(screenController.size.width * 0.3, 30),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.darkThemeBoxColor
                                : AppColors.blackTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Get.back();
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
                        height: 35,
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
                    SizedBox(
                      width: screenController.size.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        //width: double.infinity,
                        height: 35,
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

                    // ElevatedButton(
                    //   onPressed: () async {
                    //     //await screenController.userLoginFunction();
                    //     if (screenController.formKey.currentState!.validate()) {
                    //       screenController.openCheckout(price: int.parse(screenController.priceController.text));
                    //       log('price: ${screenController.priceController.text}');
                    //       Fluttertoast.showToast(msg: 'Processing payment to trainer.');
                    //       screenController.priceController.clear();
                    //     }
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     primary: AppColors.accentColor,
                    //     minimumSize: Size(
                    //       screenController.size.width * 0.3,
                    //       30,
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Ok",
                    //       style: TextStyle(
                    //         color: AppColors.whiteColor,
                    //         fontSize: 12.sp,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: screenController.size.width * 0.05,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.back();
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     primary: themeProvider.darkTheme
                    //         ? AppColors.whiteColor
                    //         : AppColors.greyTextColor.withOpacity(0.3),
                    //     minimumSize:
                    //     Size(screenController.size.width * 0.3, 30),
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Close",
                    //       style: TextStyle(
                    //         color: themeProvider.darkTheme
                    //             ? AppColors.darkThemeBoxColor
                    //             : AppColors.blackTextColor,
                    //         fontSize: 12.sp,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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

class OverViewModule extends StatelessWidget {
  OverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Overview",
          style: TextStyle(
              color: AppColors.accentTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp),
        ),
        SizedBox(height: 10),
        Html(
          data: screenController.vetsNgoDetailsData[0].fullText!,
          style: {
            "body": Style(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              //fontSize: FontSize(15.0),
              // fontWeight: FontWeight.w500,
            ),
            "p": Style(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              //fontSize: FontSize(15.0),
              // fontWeight: FontWeight.w500,
            ),
          },
        ),
        // Text(
        //   screenController.vetsNgoDetailsData.fullText!,
        //   style: TextStyle(
        //     color: themeProvider.darkTheme
        //         ? AppColors.whiteColor
        //         : AppColors.blackTextColor,
        //   ),
        // ),
        SizedBox(height: 2.h)
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 5);
  }
}

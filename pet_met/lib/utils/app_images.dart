import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../services/providers/dark_theme_provider.dart';

const root = "assets/images/";
const iconsRoot = "assets/icons/";

class AppImages {
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);
  static const petMetLogoImg = root + "petmet_logo.png";

  // static var tealBackgroundImg = themeProvider.darkTheme
  //     ? root + "path_top_right_dark.png"
  //     : root + "path_top_right_light.png";
  static var multiUserSwitchIcon = iconsRoot + "multi_user.png";

  static var backgroundImgDark = root + "path_top_right_dark.png";
  static var backgroundImgLight = root + "path_top_right_light.png";

  static var cameraPlaceHolderImgDark = root + "camera_placeholder_dark.png";
  static var cameraPlaceHolderImglight = root + "camera_placeholder_light.png";

  // static var cameraPlaceHolderImg = root +
  //     (themeProvider.darkTheme
  //         ? "camera_placeholder_dark.png"
  //         : "camera_placeholder_light.png");

  static var onboardBackImgImgDark = root + "onboard_bgshape_dark.png";
  static var onboardBackImgImglight = root + "onboard_bgshape_light.png";

  // static var onboardBackImgImg = root +
  //     (themeProvider.darkTheme
  //         ? "onboard_bgshape_dark.png"
  //         : "onboard_bgshape_light.png");

  static var onboardPathImgDark = root + "onboardtop_path_dark.png";
  static var onboardPathImglight = root + "onboardtop_path_light.png";

  // static var onboardPathImg = root +
  //     (themeProvider.darkTheme
  //         ? "onboardtop_path_dark.png"
  //         : "onboardtop_path_light.png");

  static var splashLogoImgDark = root + "splash_peoples1_dark.png";
  static var splashLogoImgLight = root + "splash_peoples1_light.png";

  // static var splashLogoImg = root +
  //     (themeProvider.darkTheme
  //         ? "splash_peoples1_dark.png"
  //         : "splash_peoples1_light.png");

  static var supportWomenImgDark = root + "women_objects_dark.png";
  static var supportWomenImgLight = root + "women_objects_light.png";

  // static var supportWomenImg = root +
  //     (themeProvider.darkTheme
  //         ? "women_objects_dark.png"
  //         : "women_objects_light.png");

  static const whiteBackgroundImg = root + "onboardtopright.png";
  static const shopAndGroomingImg = root + "shop_grooming.png";
  static const shopDetailsImg = root + "shop_details.png";
  static const phoneCallImg = root + "phone_green.png";
  static const fbImg = root + "fb.png";
  static const instaImg = root + "insta.png";
  static const whatsappImg = root + "whatsapp.png";
  static const googleMapImg = root + "image_placeholder.png";
  static const petImg = root + "dog1.png";
  static const userProfileImg = root + "user_ellipse.png";
  static const galleryImg = root + "folder_yellow.png";
  static const cameraImg = root + "camera_green.png";
  static const  googleImg = root + "gmailicon.png";
  static const  appleImg = root + "apple.png";

  static const facebookImg = root + "fbicon.png";
  static const visaImg = root + "visa_image.png";
  static const gallery2Img = root + "image_placeholder2.png";
  static const heartImg = root + "dog_love_sign.png";
  static const dogSittingImg = root + "dog_sitting_1.png";
  static const sadEmojiImg = root + "sad_red_emoji.png";
  static const petActivityImg = root + "pets_playing.png";
  static const petMateTextImg = root + "petomate_text.png";
  static const cubeImg = root + "accent_cube.png";
  static const darkWave1Img = root + "group-1-dark.png";
  static const darkWave2Img = root + "group-2-dark.png";
  static const darkWave3Img = root + "group-3-dark.png";
  static const darkWave4Img = root + "group-4-dark.png";
  static const locateHomeImg = root + "locate_home.png";
  static const infoGreenImg = root + "info_green.png";
  static const phoneGreenImg = root + "phone_green.png";
  static const locateGreenImg = root + "locate_green.png";
  static const editIconImg = root + "edit_black_icon.png";
}

// static const backButtonImg = root + "back_button.png";

class AppIcons {
  static const root = "assets/icons/";

  static const backButtonImg = root + "left_back_arrow.png";
  static const drawerButtonImg = root + "drawer_icon.png";
  static const locationImg = root + "location.png";
  static const clockImg = root + "clock.png";
  static const bottomBar1Img = root + "mate-branding_icon.png";
  static const bottomBar2Img = root + "trainging_icon.png";
  static const bottomBar3Img = root + "home.png";
  static const bottomBar4Img = root + "location_icon.png";
  static const bottomBar5Img = root + "doctor_icon.png";
  static const adoptionImg = root + "adoption.png";
  static const supportImg = root + "phone.png";
  static const aboutImg = root + "about.png";
  static const faqImg = root + "question.png";
  static const privacyPolicyImg = root + "lock.png";
  static const shareImg = root + "share.png";
  static const deleteImg = root + "delete.png";
  static const rateImg = root + "star.png";
  static const emailImg = root + "email_icon.png";
  static const callIconImg = root + "call_icon.png";
  static const whatsappImg = root + "whatsapp_icon.png";
  static const profilePetImg = root + "dog1.png";
  static const messageImg = root + "message.png";
  static const chatIconImg = root + "chat_icon1.png";
  static const verifiedSymbolImg = root + "verified_symbol.png";
  static const shopImg = root + "shop.png";
}

class AppShades {
  static const root = "assets/shades/";

  static const bgShadeLeftImg = root + "bg_shade_left.png";
}

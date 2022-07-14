import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../services/providers/dark_theme_provider.dart';

const root = "assets/images/";
DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

class AppImages {
  static const petMetLogoImg = root + "petmet_logo.png";

  static var tealBackgroundImg = root +
      (themeProvider.darkTheme
          ? "path_top_right_dark.png"
          : "path_top_right_light.png");

  static const whiteBackgroundImg = root + "onboardtopright.png";
  static const shopAndGroomingImg = root + "shop_grooming.png";
  static const shopDetailsImg = root + "shop_details.png";
  static const phoneCallImg = root + "phone_green.png";
  static const fbImg = root + "fb.png";
  static const instaImg = root + "insta.png";
  static const whatsappImg = root + "whatsapp.png";
}

// static const backButtonImg = root + "back_button.png";

class AppIcons {
  static const root = "assets/icons/";

  static const backButtonImg = root + "left_back_arrow.png";
  static const drawerButtonImg = root + "drawer_icon.png";
  static const locationImg = root + "location.png";
}

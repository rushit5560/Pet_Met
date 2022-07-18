import 'package:pet_met/utils/user_details.dart';

class ApiUrl {
  static const apiMainPath = "https://petomate.com/patomateadmin/api";
  static const apiImagePath = "https://petomate.com/patomateadmin/";

  static const loginApi = apiMainPath + "/login";
  static const registerApi = apiMainPath + "/register";
  static const bannerApi = apiMainPath + "/banner";
  static const getAllShopApi = apiMainPath + "/getallshop";
  // static const shopDetailsApi = apiMainPath + "/shopdetails";
  static const getAllTrainerApi = apiMainPath + "/getalltrainer";

  static const getAllPetApi = apiMainPath + "/getallpet";
  static const getAllVetAndNgoApi = apiMainPath + "/getallvetandngo";
  static const getAllCategoryApi = apiMainPath + "/category";
  static const getAllSubCategoryApi = apiMainPath + "/sub_category";
  static const getAllPlanApi = apiMainPath + "/getallplan";
  static const faqApi = apiMainPath + "/faq";

  // Cms
  static const privacyPolicyApi = apiMainPath + "/cms/2";
  static const petCareApi = apiMainPath + "cms/5";
  static const supportApi = apiMainPath + "/cms/4";
  static const aboutApi = apiMainPath + "/cms/3";

}

class ApiHeader {
  UserDetails userDetails = UserDetails();

  Map<String, String> apiHeader() {

    Map<String, String> header = <String, String>{
      'token': userDetails.userToken
    };

    return header;
  }


}
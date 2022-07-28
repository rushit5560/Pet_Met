import 'package:pet_met/utils/user_details.dart';

class ApiUrl {
  static const apiMainPath = "http://petomate.omdemo.co.in/api";
  static const apiImagePath = "http://petomate.omdemo.co.in/";

  static const loginApi = apiMainPath + "/login";
  static const registerApi = apiMainPath + "/registeruser";
  static const bannerApi = apiMainPath + "/banner";
  static const getAllShopApi = apiMainPath + "/getallshop";
  static const shopDetailsApi = apiMainPath + "/shopdetails";
  static const getAllTrainerApi = apiMainPath + "/trainer";
  static const getTrainerDetailsApi = apiMainPath + "/trainerdetails";

  static const getAllPetApi = apiMainPath + "/getallpet";
  static const getAllVetAndNgoApi = apiMainPath + "/getallvetandngo";
  static const getAllVetAndNgoDetailsApi = apiMainPath + "/vetandngodetails";

  static const getAllCategoryApi = apiMainPath + "/category";
  static const getAllSubCategoryApi = apiMainPath + "/subcategory/";
  static const getCategoryAndSubCategoryApi =
      apiMainPath + "/categoryandsubcategory";
  static const getAllPlanApi = apiMainPath + "/getallplan";
  static const getPlanDetailsApi = apiMainPath + "/plandetails";
  static const faqApi = apiMainPath + "/faq";

  // Cms
  static const privacyPolicyApi = apiMainPath + "/cms/2";
  static const petCareApi = apiMainPath + "/cms/5";
  static const supportApi = apiMainPath + "/cms/4";
  static const aboutApi = apiMainPath + "/cms/3";

  // Address Management
  static const getAllAddressApi = apiMainPath + "/address/";
  static const getAddAddressApi = apiMainPath + "/addressadd";
  static const setAddressIsActiveApi = apiMainPath + "/addressactive/";

  static const deleteAccountApi = apiMainPath + "/userdel/";
  static const changePasswordApi = apiMainPath + "/changepassword";
  static const topPetListApi = apiMainPath + "/pettop";

  /// Pet Profile Management
  static const petProfileApi = apiMainPath + "/petdetails/";
  static const petUpdateProfileApi = apiMainPath + "/petadd";

  /// Payment Management
  static const getPaymentListApi = apiMainPath + "/carddetails/";
  static const addNewPaymentApi = apiMainPath + "/cardadd";
  static const setPaymentIsActiveApi = apiMainPath + "/cardactive/";
}

class ApiHeader {
  // UserDetails userDetails = UserDetails();

  Map<String, String> apiHeader() {
    Map<String, String> header = <String, String>{
      'token': UserDetails.userToken
    };

    return header;
  }
}

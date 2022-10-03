import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/upload_pet_controller.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';



class UploadPetScreen extends StatefulWidget {
  UploadPetScreen({Key? key}) : super(key: key);

  @override
  State<UploadPetScreen> createState() => _UploadPetScreenState();
}

class _UploadPetScreenState extends State<UploadPetScreen> {
  final controller = Get.put(UploadPetController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // BackGroundLeftShadow(
            //   height: controller.size.height * 0.3,
            //   width: controller.size.height * 0.3,
            //   topPad: controller.size.height * 0.25,
            //   leftPad: -controller.size.width * 0.15,
            // ),
            // BackGroundRightShadow(
            //   height: controller.size.height * 0.3,
            //   width: controller.size.height * 0.3,
            //   topPad: controller.size.height * 0.45,
            //   rightPad: -controller.size.width * 0.15,
            // ),
            BackgroundImage(),

            Obx(
              () => controller.isLoading.value
                  ? const CustomAnimationLoader()
                  : Column(
                      children: [
                        CustomAppBar(
                          appBarOption: AppBarOption.singleBackButtonOption,
                          title: controller.petOption == PetOption.addOption
                              ? "Add Pet"
                              : "Update Pet",
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       GestureDetector(
                        //         onTap: () {
                        //           Get.back();
                        //         },
                        //         child: Image.asset(
                        //           "assets/icons/left_back_arrow.png",
                        //           width: controller.size.width * 0.07,
                        //         ),
                        //       ),
                        //       const SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Form(
                                key: controller.updatePetFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15),
                                    UploadImageModule(),
                                    const SizedBox(height: 30),
                                    PetNameTextFieldModule(),
                                    const SizedBox(height: 15),
                                    TypesOfPetDropDownModule(),
                                    const SizedBox(height: 15),
                                    PetSubCategoryDropDownModule(),
                                    const SizedBox(height: 15),
                                    PetDetailsTextFieldModule(),
                                    const SizedBox(height: 15),
                                    MeetingAvailabilityDropDown(),
                                    const SizedBox(height: 15),
                                    const GenderDropDown(),
                                    const SizedBox(height: 15),
                                    BirthDateDropDown(),
                                    const SizedBox(height: 15),
                                    WeightTextFieldModule(),
                                    const SizedBox(height: 30),
                                    PetSubmitButton(),
                                    const SizedBox(height: 15),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /*/// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }
  }*/
}

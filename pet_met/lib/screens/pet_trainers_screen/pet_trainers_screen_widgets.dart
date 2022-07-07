import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_screen_controller.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';



class PetTrainerListModule extends StatelessWidget {
  PetTrainerListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.petTrainersList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        String shopName = screenController.petTrainersList[i];
        return _petTrainerListTile(shopName);
      },
    ).commonAllSidePadding(padding: 10);
  }


  Widget _petTrainerListTile(String shopName) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.petTrainerDetailsScreenRoute);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 1.w),
                  const Text(
                    "Beside Kantilal Jewellers, Saragam Shopping Center, U 11-12, Anmol Complex Near, Surat 395007",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';

class PetMeetingListModule extends StatelessWidget {
  const PetMeetingListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return DogDisplayWidget(
          onTap: () {
            Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute);
          },
        );
      },
    );
  }
}

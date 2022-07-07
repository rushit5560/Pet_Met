import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ContactContainerWidget extends StatelessWidget {
  const ContactContainerWidget({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  final imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.accentColor.withOpacity(0.3),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../app_colors.dart';



class BackGroundLeftShadow extends StatelessWidget {
  const BackGroundLeftShadow({
    Key? key,
    this.width,
    this.height,
    this.leftPad,
    this.topPad,
  }) : super(key: key);

  final width;
  final height;
  final topPad;
  final leftPad;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Positioned(
      top: topPad,
      left: leftPad,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 50,
              spreadRadius: 30,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor.withOpacity(0.05)
                  : AppColors.accentColor.withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}

class BackGroundRightShadow extends StatelessWidget {
  const BackGroundRightShadow({
    Key? key,
    this.width,
    this.height,
    this.rightPad,
    this.topPad,
  }) : super(key: key);

  final width;
  final height;
  final topPad;
  final rightPad;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Positioned(
      top: topPad,
      right: rightPad,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 28,
              spreadRadius: 25,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor.withOpacity(0.05)
                  : AppColors.accentColor.withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}

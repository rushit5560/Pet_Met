import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';

import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/app_routes.dart';
import 'package:pet_met/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.blackColor,
      statusBarColor: AppColors.blackColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SplashController());

    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
          child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                // theme: appThemeData,
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                initialRoute: AppRouteNames.splashRoute,
                getPages: AppRoutes().routes,
              );
            },
          ),
        );
      },
    );
  }
}

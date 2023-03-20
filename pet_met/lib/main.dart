import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_notification_channel/flutter_notification_channel.dart';
// import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:get/get.dart';
import 'package:pet_met/notificationservice/local_notification_service.dart';
// import 'package:pet_met/notificationservice/local_notification_service.dart';
import 'package:pet_met/screens/firebase_option.dart';
import 'package:pet_met/screens/splash_screen/splash_screen.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "pet'o-mate", options: DefaultFirebaseOptions.currentPlatform);

  

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
  ).then(
    (value) async {
      // _initializeFirebase();

      // var result = await FlutterNotificationChannel.registerNotificationChannel(
      //   description: 'For Showing Message Notification',
      //   id: 'chats',
      //   importance: NotificationImportance.IMPORTANCE_HIGH,
      //   name: 'Chats',
      // );
      // log('Notification Channel Result: $result');

  //     Future<void> backgroundHandler(RemoteMessage message) async {
  //   log(message.data.toString());
  //   log("${message.notification!.title}");
  // }

  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);

      runApp(const MyApp());
    },
  );
}

// _initializeFirebase() async {
//   // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   var result = await FlutterNotificationChannel.registerNotificationChannel(
//       description: 'For Showing Message Notification',
//       id: 'chats',
//       importance: NotificationImportance.IMPORTANCE_HIGH,
//       name: 'Chats',);
//   log('\nNotification Channel Result: $result');
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        log("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          log("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        log("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          log("${message.notification!.title}");
          log("${message.notification!.body}");
          log("message.data11 ${message.data}");
          LocalNotificationService.disPlay(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        log("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          log("${message.notification!.title}");
          log("${message.notification!.body}");
          log("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
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
                //initialRoute: AppRouteNames.splashRoute,
                //getPages: AppRoutes().routes,
                home: SplashScreen(),
              );
            },
          ),
        );
      },
    );
  }
}

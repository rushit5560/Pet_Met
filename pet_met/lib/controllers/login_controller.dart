import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import '../screens/index_screen/index_screen.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isPasswordVisible = true.obs;

  var mailController = TextEditingController();
  var passController = TextEditingController();
  var selectedPageIndex = 0.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserPreference userPreference = UserPreference();

  final formKey = GlobalKey<FormState>();

  // FacebookUserProfile? profile;
  // final FacebookLogin  plugin = FacebookLogin(debug: true);

  final fb = FacebookLogin();

  Future<void> submitLoginForm() async {
    if (formKey.currentState!.validate()) {
      try {
        await userLoginFunction();
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> userLoginFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('Login Api Url : $url');

    try {
      Map<String, dynamic> data = {
        "email": mailController.text.trim().toLowerCase(),
        "password": passController.text.trim(),
        "categoryID": "${UserDetails.roleId}",
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Login Api Response : ${response.body}");

      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      isSuccessStatus = loginModel.success.obs;

      if (isSuccessStatus.value) {
        // User Data Set in Prefs
        await userPreference.setUserDetails(
          selfId: loginModel.data.uid, // userID
          userId: loginModel.data.id,
          userName: loginModel.data.name,
          userEmail: loginModel.data.email,
          userProfileImage: loginModel.data.image,
          token: loginModel.data.rememberToken,
          roleId: loginModel.data.categoryId,
          shopName: loginModel.data.shopename,
          shopProfile: loginModel.data.showimg,
        );
        log('shop Name: ${loginModel.data.shopename}');

        mailController.clear();
        passController.clear();
        //await userPreference.setRoleId(roleId);
        // Going to Index Screen
        Get.offAll(
          () => IndexScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500),
        );
      } else {
        //Fluttertoast.showToast(msg: loginModel.error);
        if (loginModel.error.contains('password don\'t match')) {
          Fluttertoast.showToast(msg: "Invalid password");
        }
        if (loginModel.error.contains('Email don\'t match')) {
          Fluttertoast.showToast(msg: "Invalid email");
        }

        if (loginModel.messege.contains('User account is deleted')) {
          Fluttertoast.showToast(msg: loginModel.messege);
        }
        if (loginModel.messege.contains("This user is unauthorized")) {
          Fluttertoast.showToast(
              msg:
                  "This user is unauthorized for selected category! Please try again");
        }
      }
    } catch (e) {
      log('User Login Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  Future signInWithGoogleFunction() async {
    isLoading(true);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      // User? user = result.user;
      // log("Email: ${result.user!.email}");
      // log("Username: ${result.user!.displayName}");
      // log("User Id: ${result.user!.uid}");

      //login = prefs.getString('userId');
      //print(login);
      if (result != null) {
        String userName = result.user!.displayName!;
        String email = result.user!.email!;
        String googleKeyId = result.user!.uid;

        log("Username : $userName");
        log("email : $email");
        log("googleKeyId : $googleKeyId");

        await socialMediaRegisterFunction(
          userName: userName,
          userEmail: email,
          userId: googleKeyId,
        );
      }
    }
    isLoading(false);
  }
  // old
  // Future signInWithFacebookFunction() async {
  //   await fb.logOut();
  //
  //   final res = await fb.logIn(
  //     permissions: [
  //       FacebookPermission.publicProfile,
  //       FacebookPermission.email,
  //     ],
  //   );
  //
  //   // try {
  //   //   final _instance = FacebookAuth.instance;
  //   //   final result = await _instance.login(permissions: ['email']);
  //   //   if (result.status == LoginStatus.success) {
  //   //     log('login success');
  //   //     log('${result.message}');
  //   //     final OAuthCredential credential =
  //   //         FacebookAuthProvider.credential(result.accessToken!.token);
  //   //     log('${credential.secret}');
  //   //     final a = await _auth.signInWithCredential(credential);
  //   //     log('${a.additionalUserInfo}');
  //   //     await _instance.getUserData().then((userData) async {
  //   //       log('userData is : ${userData}');
  //   //       await _auth.currentUser!.updateEmail(userData['email']);
  //
  //   //       log("usermail is ${userData['email']}");
  //   //       log("username is ${a.additionalUserInfo!.username}");
  //   //     });
  //   //     return null;
  //   //   } else if (result.status == LoginStatus.cancelled) {
  //   //     return 'Login cancelled';
  //   //   } else {
  //   //     return 'Error';
  //   //   }
  //   // } catch (e) {
  //   //   log("erro occured : ${e.toString()}");
  //
  //   //   rethrow;
  //   // }
  //
  //   // Check result status
  //   switch (res.status) {
  //     case FacebookLoginStatus.success:
  //       // Logged in
  //
  //       // Send access token to server for validation and auth
  //       final FacebookAccessToken accessToken = res.accessToken!;
  //       log('Access token: ${accessToken.token}');
  //
  //       // Get profile data
  //       final profile = await fb.getUserProfile();
  //       log('Hello, ${profile!.name}! You ID: ${profile.userId}');
  //
  //       // Get user profile image url
  //       final imageUrl = await fb.getProfileImageUrl(width: 100);
  //       log('Your profile image: $imageUrl');
  //
  //       // Get email (since we request email permission)
  //       final email = await fb.getUserEmail();
  //       log('Your profile email: $email');
  //
  //       // But user can decline permission
  //       if (email != null) {
  //         String userName = "${profile.firstName}";
  //         String fbKeyId = profile.userId;
  //
  //         log('userName : $userName');
  //         log('fbKeyId : $fbKeyId');
  //         log('email : $email');
  //
  //         await socialMediaRegisterFunction(
  //           userName: userName,
  //           userEmail: email,
  //           userId: fbKeyId,
  //         );
  //       }
  //
  //       break;
  //     case FacebookLoginStatus.cancel:
  //       // User cancel log in
  //       break;
  //     case FacebookLoginStatus.error:
  //       // Log in failed
  //       log('Error while log in: ${res.error}');
  //       break;
  //   }
  //
  //   //await plugin.logOut();
  //   await plugin.logIn(
  //     permissions: [
  //       FacebookPermission.publicProfile,
  //       FacebookPermission.email,
  //     ],
  //   );
  //
  //   await subPartOfFacebookLogin();
  // }

  // new
  facebookLogin() async {
    try {
      final result =
      await FacebookAuth.i.login(permissions: ['email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        log("$userData");

        // String userName = userData[''];
        // String email = email;
        // String fbKeyId = fbKeyId;

        // await socialMediaRegisterFunction(
        //             userName: userName,
        //             userEmail: email,
        //             userId: fbKeyId,
        //           );

      }
    } catch (error) {
      log("$error");
    }
  }

  Future<void> socialMediaRegisterFunction({
    required String userName,
    required String userEmail,
    required String userId,
  }) async {
    isLoading(true);
    String url = ApiUrl.socialMediaRegisterApi;
    log("Social Media Register Api Url : $url");

    try {
      Map<String, dynamic> data = {
        'name': userName,
        'email': userEmail,
        'password': '12345678',
        'categoryID': "${UserDetails.roleId}",
        'googlekey': userId,
      };
      log("data : $data");

      //todo - differentiate with user category id
      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Login Api Response : ${response.body}");

      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      isSuccessStatus = loginModel.success.obs;

      if (isSuccessStatus.value) {
        // User Data Set in Prefs
        await userPreference.setUserDetails(
          selfId: loginModel.data.uid, // userID
          userId: loginModel.data.id,
          userName: loginModel.data.name,
          userEmail: loginModel.data.email,
          userProfileImage: loginModel.data.image,
          token: loginModel.data.rememberToken,
          roleId: loginModel.data.categoryId,
          shopName: loginModel.data.shopename,
          shopProfile: loginModel.data.showimg,
        );
        log('shop Name: ${loginModel.data.shopename}');

        mailController.clear();
        passController.clear();
        //await userPreference.setRoleId(roleId);
        // Going to Index Screen
        Get.offAll(
          () => IndexScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500),
        );
      } else {
        if (loginModel.error.contains('password don\'t match')) {
          Fluttertoast.showToast(msg: "Invalid password");
        }
        if (loginModel.error.contains('Email don\'t match')) {
          Fluttertoast.showToast(msg: "Invalid email");
        }

        if (loginModel.messege.contains('User account is deleted')) {
          Fluttertoast.showToast(msg: loginModel.messege);
        }
        if (loginModel.messege.contains("This user is unauthorized")) {
          Fluttertoast.showToast(
              msg:
                  "This user is unauthorized for selected category! Please try again");
        }
      }
    } catch (e) {
      log("socialMediaRegisterFunction Error :$e");
    }
  }

  /*subPartOfFacebookLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final plugin1 = plugin;
    final token = await plugin1.accessToken;

    String? email;
    String? imageUrl;

    if (token != null) {
      log("token===$token");
      profile = await plugin1.getUserProfile();
      log("profile===$profile");
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin1.getUserEmail();
        mailController.text = email!;
      }
      imageUrl = await plugin1.getProfileImageUrl(width: 100);
      if(profile != null) {
        if(profile!.userId.isNotEmpty) {

          //String userName = profile!.name!;
         // String userName = profile!.name!;
          mailController.text = email!;
          //passwordFieldController.text = "${userNameFieldController.text}@123";

          await userLoginFunction();
          await plugin.logOut();

          // prefs.setString('userId', profile!.userId);
          // prefs.setString('userName', profile!.firstName!);
          // prefs.setString('email', email!);
          // prefs.setString('photo', imageUrl!.toString());

          // String ? userId = prefs.getString('userId');
          // String ? uName = prefs.getString('userName');
          // String ? uEmail = prefs.getString('email');
          // String ? uPhotoUrl = prefs.getString('photo');
          // log('id: $userId, username : $uName, email : $uEmail, photo : $uPhotoUrl');
        }
      }

    }
  }*/

}

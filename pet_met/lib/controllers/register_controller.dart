import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/models/register_screen_model/register_model.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  RxBool isPasswordVisible = true.obs;

  TextEditingController mailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool selectedTerms = false.obs;
  UserDetails userDetails = UserDetails();
  UserPreference userPreference = UserPreference();

  final formKey = GlobalKey<FormState>();
  // final fb = FacebookLogin();
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Form Submit Validator
  submitRegisterForm() async {
    if (formKey.currentState!.validate()) {
      if (selectedTerms.value == false) {
        Fluttertoast.showToast(
            msg: "Please agree with terms and condition & privacy policy");
      } else {
        try {
          await userRegisterFunction();
          // ScaffoldMessenger.of(Get.context!).showSnackBar(
          //   SnackBar(
          //     content: Text("Form Submitted"),
          //     duration: Duration(seconds: 3),
          //   ),
          // );
        } catch (e) {
          throw e;
        }
      }
    }
  }

  /// User Registration
  Future<void> userRegisterFunction() async {
    isLoading(true);
    String url = ApiUrl.registerApi;
    log("Register Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "email": mailController.text.trim().toLowerCase(),
        "password": passController.text.trim(),
        "c_password": passController.text.trim(),
        "categoryID": "${UserDetails.roleId}",
        "name": nameController.text.trim()
      };
      log("Body Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response : ${response.body}");

      RegisterModel registerModel =
          RegisterModel.fromJson(json.decode(response.body));
      isSuccessStatus = registerModel.success!.obs;

      // RegisterErrorModel registerErrorModel =
      //     RegisterErrorModel.fromJson(json.decode(response.body));

      if (isSuccessStatus.value) {
        log("isSuccessStatus : ${isSuccessStatus.value}");
        Fluttertoast.showToast(msg: registerModel.messege!);

        mailController.clear();
        nameController.clear();
        passController.clear();

        // User Data Set in Prefs
        /*await userPreference.setUserDetails(
            userId: registerModel.data[0].id,
            userName: registerModel.data[0].name,
            userEmail: registerModel.data[0].email,
            userProfileImage: registerModel.data[0].image,
          token: registerModel.data[0].rememberToken,
        );*/

        // Going to Login Screen
        // Get.offAndToNamed(AppRouteNames.loginRoute);
        Get.back();
      } else {
        if (registerModel.error
            .toString()
            .contains("The name has already been taken")) {
          Fluttertoast.showToast(msg: "The name has already been taken");
        } else {
          Fluttertoast.showToast(msg: "The email has already register");
        }
      }
    } catch (e) {
      log("User Registration Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Future signInWithGoogleFunction() async {
  //   isLoading(true);
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   googleSignIn.signOut();
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     // Getting users credential
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     // User? user = result.user;
  //     // log("Email: ${result.user!.email}");
  //     // log("Username: ${result.user!.displayName}");
  //     // log("User Id: ${result.user!.uid}");

  //     //login = prefs.getString('userId');
  //     //print(login);
  //     if (result != null) {
  //       String userName = result.user!.displayName!;
  //       String email = result.user!.email!;
  //       String googleKeyId = result.user!.uid;

  //       log("Username : $userName");
  //       log("email : $email");
  //       log("googleKeyId : $googleKeyId");

  //       await socialMediaRegisterFunction(
  //         userName: userName,
  //         userEmail: email,
  //         userId: googleKeyId,
  //       );
  //     }
  //   }
  //   isLoading(false);
  // }

  Future signInWithGoogleFunction() async {
    // isLoading(true);

    SharedPreferences prefs = await SharedPreferences.getInstance();

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

      // Getting users credentia
      UserCredential result = await auth.signInWithCredential(authCredential);

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
  }

  // Future signInWithAppleFunction() async {
  //   log("signInWithAppleFunction");
  //   isLoading(true);
  //   try {
  //     log("apple login 11");
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     log("apple login 22");
  //     log("apple login email are :: ${credential.email}");
  //     log("apple login givenName are :: ${credential.givenName}");

  //     // if (credential.email!.isNotEmpty && credential.givenName!.isNotEmpty) {
  //     await socialMediaRegisterFunction(
  //       userName: credential.givenName! + credential.familyName!,
  //       userEmail: credential.email!,
  //       userId: credential.authorizationCode,
  //     );
  //     // } else {
  //     //   log("signInWithAppleFunction error");
  //     // }
  //   } catch (e) {
  //     log("error occured while apple signin :: $e");
  //     rethrow;
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future signInWithAppleFunction() async {
    log("signInWithAppleFunction 11");
    // isLoading(true);
    try {
      log("apple login 11");

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      log('credential : $credential');

      final oAuthProvider = OAuthProvider('apple.com');
      oAuthProvider.addScope(credential.email.toString());
      oAuthProvider.addScope(credential.familyName.toString());
      log("oAuthProvider$oAuthProvider");
      auth.signInWithEmailAndPassword(
          email: credential.email.toString(),
          password: credential.familyName.toString());
      log("apple login email are :: ${credential.email}");
      log("apple login givenName are :: ${credential.givenName}");
      final AuthCredential authCredential = oAuthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      UserCredential result = await auth.signInWithCredential(authCredential);
      log("apple login 22");
      log("authCredential $authCredential");
      log("apple login email are :: ${credential.email}");
      log("apple login givenName are :: ${credential.givenName}");
      log("result $result");

      // await auth.currentUser;
      if (auth.currentUser != null) {
        log("auth.currentUser!");
        await socialMediaRegisterFunction(
          userName: auth.currentUser!.displayName.toString(),
          userEmail: auth.currentUser!.email.toString(),
          userId: auth.currentUser!.uid,
        );
      } else if (result != null) {
        log("result");
        await socialMediaRegisterFunction(
          userName: credential.givenName! + credential.familyName!,
          userEmail: credential.email!,
          userId: credential.authorizationCode,
        );
      }
    } catch (e) {
      log("error occured while apple signin :: $e");
      rethrow;
    } /*finally {
      isLoading(false);
    }*/
    // isLoading(false);
  }
  // Future signInWithFacebookFunction() async {
  //   //await fb.logOut();
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
  //   /*await plugin.logIn(
  //     permissions: [
  //       FacebookPermission.publicProfile,
  //       FacebookPermission.email,
  //     ],
  //   );
  //
  //   await subPartOfFacebookLogin();*/
  // }

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
      log("socialMediaRegisterFunction data : $data");

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
}

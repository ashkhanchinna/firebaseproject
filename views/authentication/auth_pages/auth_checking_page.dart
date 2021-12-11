import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimoney/views/authentication/auth_pages/signup_form_page.dart';
import 'package:matrimoney/views/landing_page/landing_page.dart';

class AuthChecking extends StatelessWidget {
  AuthChecking({ Key? key }) : super(key: key);
   FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
   if (auth.currentUser != null) {
       return  LandingPgae();
    } else {       return const SignupPage();
    }
  }
}



// class AuthCheckingController extends GetxController {
//   @override
//   void onInit() {
//     check();
//     super.onInit();
//   }

//   FirebaseAuth auth = FirebaseAuth.instance;

//   Widget check() {
//     if (auth.currentUser != null) {
//       return const HomePage();
//     } else {
//       return const SignupPage();
//     }
//   }
// }

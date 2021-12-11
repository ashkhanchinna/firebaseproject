import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:matrimoney/controllers/profile_page_controller/profile_page_controller.dart';

import 'package:matrimoney/views/landing_page/landing_page.dart';

class SigninFormController extends GetxController {
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var loading = false.obs;
  // ProfilePageController controller =
  //     Get.put(ProfilePageController(), tag: "data");

  login() async {
    loading.value = true;

    try {
      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginPassword.text);

      //controller.getDetails();
      Get.offAll(() => LandingPgae());
      loading.value = false;
      Get.snackbar("success", "loggegin");
    } catch (e) {
      loading.value = false;
      Get.snackbar("success", "$e");
    }
  }

  String? emailValidation(String? value) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value!);
    if (value.isEmpty) {
      return ("email can't empty");
    }
    if (!emailValid) {
      return "enater valid email";
    }
  }

  String? passwordvalidation(String? value) {
    if (value!.isEmpty) {
      return ("Password can't empty");
    }
  }
}

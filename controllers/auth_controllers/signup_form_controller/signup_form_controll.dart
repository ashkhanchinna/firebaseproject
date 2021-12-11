import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class SignupFormValidateController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  var obscuretext = true.obs;

  void passwordeye() {
    if (obscuretext.value == true) {
      obscuretext.value = false;
    } else {
      obscuretext.value = true;
    }
  }

  String? passwordvalidate(String? value) {
    if (value!.isEmpty) {
      return ("Password can't empty");
    }
    if (value.length < 6) {
      return "min 6  charecter";
    }
  }

  String? emailValidate(String? value) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value!);
    if (value.isEmpty) {
      return ("email can't empty");
    }
    if (!emailValid) {
      return "enater valid email";
    }
  }

  String? firstNameValidate(String? value) {
    if (value!.isEmpty) {
      return ("firstName can't empty");
    }
    if (value.length < 3) {
      return "min 3  charecter";
    }
  }

  String? lastNameValidate(String? value) {
    if (value!.isEmpty) {
      return ("lastname can't empty");
    }
    if (value.length < 3) {
      return "min 3  charecter";
    }
  }

  String? userNameValidate(String? value) {
    if (value!.isEmpty) {
      return ("username can't empty");
    }
    if (value.length < 3) {
      return "min 3  charecter";
    }
  }

  String? phoneNumberValidate(String? value) {
    if (value!.isEmpty) {
      return ("phoneNumber can't empty");
    }
    if (value.length < 10) {
      return "min 10  charecter";
    }
  }

  

 
}

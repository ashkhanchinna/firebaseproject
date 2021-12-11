import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressFormController extends GetxController {
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  // var dateValue = "".obs;
  // var monthValue = "".obs;
  // getdate(String? value) {
  //   if (value != null) {
  //     dateValue.value = value;
  //   } else {
  //     Get.snackbar("error", "select date");
  //   }
  // }

  // getmonth(String? value) {
  //  if (value != null) {
  //     monthValue.value = value;
  //   } else {
  //     Get.snackbar("error", "select month");
  //   }
  // }

  String? addressValidate(String? value) {
    if (value!.isEmpty) {
      return ("address cant empty");
    }
    if (value.length < 10) {
      return ("min 10 character");
    }
  }

  String? stateValidate(String? value) {
    if (value!.isEmpty) {
      return ("state cant empty");
    }
    if (value.length < 3) {
      return ("min 10 character");
    }
  }

  String? cityValidate(String? value) {
    if (value!.isEmpty) {
      return ("city cant empty");
    }
    if (value.length < 10) {
      return ("min 5 character");
    }
  }

  String? pincodeValidate(String? value) {
    if (value!.isEmpty) {
      return ("pincode cant empty");
    }
    if (value.length < 6) {
      return ("min 6 character");
    }
  }

  String? datevalidate(String? value) {
    if (value!.isEmpty) {
      return ("date of birth cant empty");
    }
    if (value.length < 2 && value.length > 1) {
      return ("min 2 character");
    }
  }

  String? monthvalidate(String? value) {
    if (value!.isEmpty) {
      return ("date of birth cant empty");
    }
    if (value.length < 1 && value.length > 1) {
      return ("min 2 character");
    }
  }

  String? yearValidate(String? value) {
    if (value!.isEmpty) {
      return ("date of birth cant empty");
    }
    if (value.length < 3 && value.length > 3) {
      return ("min 2 character");
    }
  }


  
}

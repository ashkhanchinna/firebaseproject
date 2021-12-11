import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimoney/controllers/auth_controllers/address_form_controller/address_database_controller.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_database_controller.dart';
import 'package:matrimoney/controllers/profile_page_controller/profile_page_controller.dart';
import 'package:matrimoney/models/user_details/user_details.dart';
import 'package:matrimoney/views/home/home_page.dart';
import 'package:matrimoney/views/landing_page/landing_page.dart';

class PictureFormController extends GetxController {
  SignupDatabaseController signup =
      Get.put(SignupDatabaseController(), tag: "signupdata");
  TextEditingController optional = TextEditingController();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  AddressDatabaseController formControll =
      Get.put(AddressDatabaseController(), tag: "address");

  var loading = false.obs;
  var image = "".obs;
  var imageurl = "".obs;
  ImagePicker picker = ImagePicker();
  pickimage() async {
    final pick = await picker.pickImage(source: ImageSource.gallery);
    if (pick != null) {
      image.value = pick.path;
    } else {
      Get.snackbar("title", "message");
    }
  }

  Future uploadImage() async {
    loading.value = true;
    try {
      if (image != "") {
        Reference ref =
            storage.ref().child(signup.auth.currentUser!.uid).child("image");
        await ref.putFile(File(image.value));
        imageurl.value = await ref.getDownloadURL();
        await uploadDatabase();
        loading.value = false;
      } else {
        Get.offAll(() => LandingPgae());
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("title", "error");
    }
  }

  uploadDatabase() async {
    final user = signup.auth.currentUser;

    UserSignupDetails userDetails = UserSignupDetails();

    userDetails.firstName = signup.formcontroll.firstName.text;
    userDetails.lastName = signup.formcontroll.lastName.text;
    userDetails.userName = signup.formcontroll.userName.text;
    userDetails.phoneNumber = signup.formcontroll.phoneNumber.text;
    userDetails.email = signup.formcontroll.email.text;
    userDetails.lastName = signup.formcontroll.lastName.text;

    userDetails.address = formControll.formControl.address.text;
    userDetails.state = formControll.formControl.state.text;
    userDetails.city = formControll.formControl.city.text;
    userDetails.pincode = formControll.formControl.pincode.text;
    userDetails.dateOfBirth =
        "${formControll.formControl.date.text}-${formControll.formControl.month.text}-${formControll.formControl.year.text}";

    userDetails.imageUrl = imageurl.value;
    userDetails.about = optional.text;

    await db.collection("users").doc(user!.uid).update(userDetails.tojson());
    Get.offAll(() => LandingPgae());
  }
}

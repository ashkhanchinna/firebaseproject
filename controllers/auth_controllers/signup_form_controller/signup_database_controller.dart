import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_form_controll.dart';
import 'package:matrimoney/models/user_details/user_details.dart';
import 'package:matrimoney/views/authentication/auth_pages/address_form_page.dart';

class SignupDatabaseController extends GetxController {
  SignupFormValidateController formcontroll =
      Get.find<SignupFormValidateController>(tag: "signup");
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  UserSignupDetails userdata = UserSignupDetails();
  var loading = false.obs;

  signup() async {
    loading.value = true;
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: formcontroll.email.text,
              password: formcontroll.password.text)
          .then((value) async {
        User? user = auth.currentUser;
        UserSignupDetails userdata = UserSignupDetails();

        userdata.firstName = formcontroll.firstName.text;
        userdata.lastName = formcontroll.lastName.text;
        userdata.userName = formcontroll.userName.text;
        userdata.id = user!.uid;
        userdata.email = user.email;
        userdata.phoneNumber = formcontroll.phoneNumber.text;

        if (userdata != null) {
          await db.collection("users").doc(user.uid).set(userdata.tojson());
          Get.snackbar(
            "welcome",
            "login succelful",
          );

          Get.to(() => const AddressFormPage());
          loading.value = false;
        }
      });
    } catch (e) {
      loading.value = false;
      Get.snackbar("{$e)}", "");
    }
  }


   @override
  void onClose() {
    formcontroll.firstName.clear();
    formcontroll.lastName.clear();
    formcontroll.userName.clear();
   formcontroll.phoneNumber.clear();
    formcontroll.password.clear();
    formcontroll.email.clear();
    super.onClose();
  }
}

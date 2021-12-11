import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:matrimoney/controllers/auth_controllers/address_form_controller/adress_form_controll.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_database_controller.dart';
import 'package:matrimoney/models/user_details/user_details.dart';
import 'package:matrimoney/views/authentication/auth_pages/picture_form_page.dart';

class AddressDatabaseController extends GetxController {
  AddressFormController formControl =
      Get.find<AddressFormController>(tag: "addresspage");
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  SignupDatabaseController signup =
      Get.put(SignupDatabaseController(), tag: "signupdata");
  var loading = false.obs;

  postAddress() async {
    loading.value = true;
    try {
      //au UserDetails userDetails = signup.signin();
      UserSignupDetails userDetails = UserSignupDetails();

      userDetails.firstName = signup.formcontroll.firstName.text;
      userDetails.lastName = signup.formcontroll.lastName.text;
      userDetails.userName = signup.formcontroll.userName.text;
      userDetails.phoneNumber = signup.formcontroll.phoneNumber.text;
      userDetails.email = signup.formcontroll.email.text;
      userDetails.lastName = signup.formcontroll.lastName.text;

      userDetails.address = formControl.address.text;
      userDetails.state = formControl.state.text;
      userDetails.city = formControl.city.text;
      userDetails.pincode = formControl.pincode.text;
      userDetails.dateOfBirth =
          "${formControl.date.text}-${formControl.month.text}-${formControl.year.text}";

      await db
          .collection("users")
          .doc(signup.auth.currentUser!.uid)
          .update(userDetails.tojson());
      Get.to(() => const PictureFormPage());
      loading.value = false;
      Get.snackbar("details", "succesfully added");
    } catch (e) {
      loading.value = false;
      Get.snackbar("welcome", "$e");
    }
  }
}

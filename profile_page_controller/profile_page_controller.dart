import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:matrimoney/controllers/auth_controllers/address_form_controller/adress_form_controll.dart';
import 'package:matrimoney/controllers/auth_controllers/picture_form_controller/picture_form_controller.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_form_controll.dart';
import 'package:matrimoney/models/user_details/user_details.dart';

class ProfilePageController extends GetxController {
  SignupFormValidateController controll =
      Get.put(SignupFormValidateController(), tag: "signup");
  AddressFormController address =
      Get.put(AddressFormController(), tag: "addresspage");
  PictureFormController optional = Get.put(PictureFormController());
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Rx<UserSignupDetails> user = UserSignupDetails().obs;
  var updateLoading = false.obs;
  var imageedit = false.obs;
  var edit = false.obs;

  var loading = true.obs;
  @override
  void onInit() {
    getDetails();
    super.onInit();
  }

  getDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then((value) {
      user.value = UserSignupDetails.fromjson(value.data()!);
      textControll();
    });
  }

  textControll() async {
    controll.firstName.text = user.value.firstName ?? "name";
    controll.lastName.text = user.value.lastName ?? "last name";
    controll.userName.text = user.value.userName ?? "username";
    controll.email.text = user.value.email ?? "email";
    controll.phoneNumber.text = user.value.phoneNumber ?? "phonenumber";
    address.address.text = user.value.address ?? "address";
    address.state.text = user.value.state ?? "state";
    address.city.text = user.value.city ?? "city";
    address.pincode.text = user.value.pincode ?? "pincode";
    address.date.text = user.value.dateOfBirth.toString().substring(0, 2);
    address.month.text = user.value.dateOfBirth.toString().substring(3, 5);
    address.year.text = user.value.dateOfBirth.toString().substring(6, 10);
    optional.optional.text = user.value.about ?? "about";
    loading.value = false;
    optional.imageurl.value = user.value.imageUrl ?? "";
  }

  updatefunction() async {
    UserSignupDetails userDetails = UserSignupDetails();
    loading.value = true;
    try {
      userDetails.firstName = controll.firstName.text;
      userDetails.lastName = controll.lastName.text;
      userDetails.userName = controll.userName.text;
      userDetails.email = auth.currentUser!.email;
      userDetails.phoneNumber = controll.phoneNumber.text;
      userDetails.address = address.address.text;
      userDetails.state = address.state.text;
      userDetails.city = address.city.text;
      userDetails.pincode = address.pincode.text;
      userDetails.dateOfBirth =
          "${address.date.text}-${address.month.text}-${address.year.text}";
      userDetails.about = optional.optional.text;
      
      userDetails.id = auth.currentUser!.uid;

      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .update(userDetails.tojson())
          .then((value) {
        loading.value = false;
        Get.snackbar("Success", "updated");
      });
    } catch (e) {
      Get.snackbar("$e", "Something wrong");
      loading.value = false;
    }
  }
}

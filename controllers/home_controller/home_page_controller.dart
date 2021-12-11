import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:matrimoney/models/user_details/user_address_model.dart';
import 'package:matrimoney/models/user_details/user_details.dart';

class HomeController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  var list = <UserSignupDetails>[].obs;
  var adlist = <UserAddressDetails>[].obs;
  var loading = true.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    getdatas();
    super.onInit();
  }

  Future<void> getdatas() async {
    Future.wait([
      signdetails(),
      // addressDetails(),
    ]).then((value) {
      loading.value = false;
      print(value.length);
    });
  }

  Future<void> signdetails() async {
    await db.collection("users").get().then((value) {
      list.value =
          value.docs.map((e) => UserSignupDetails.fromjson(e.data())).toList();
    });
  }

  // Future<void> addressDetails() async {
  //   await db
  //       .collection("users")
  //       .doc(auth.currentUser!.uid)
  //       .collection("Address")
  //       .get()
  //       .then((value) {
  //     adlist.value = value.docs
  //         .map((e) => UserAddressDetails.fromjson(e!.data()))
  //         .toList();
  //   });
  // }
}

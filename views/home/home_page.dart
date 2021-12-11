import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:matrimoney/controllers/home_controller/home_page_controller.dart';
import 'package:matrimoney/models/user_details/user_details.dart';
import 'package:matrimoney/views/authentication/auth_pages/signin_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserSignupDetails user = UserSignupDetails();
  final controll = Get.put(HomeController());
  FirebaseAuth auth = FirebaseAuth.instance;
  // final Stream<List<UserSignupDetails>> data = FirebaseFirestore.instance
  //     .collection("users")
  //     .snapshots()
  //     .map((event) => event.docs
  //         .map((e) => UserSignupDetails.fromjson(e!.data()))
  //         .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: [
            IconButton(
                onPressed: () async {
                  await auth.signOut();
                  Get.offAll(() => const SigninFormPage());
                },
                icon: Icon(Icons.logout,color: Colors.red,))
          ],
        ),
        body: Obx(() => controll.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controll.list.length,
                itemBuilder: (c, i) {
                  final data = controll.list[i];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data.imageUrl.toString()),
                    ),
                    title: Text(data.firstName.toString()),
                    subtitle: Text(data.address.toString()),
                    onTap: () {
                    Get.to(() => DetailPage(
                            user: data,
                          ));
                    },
                  );
                })));
  }
}

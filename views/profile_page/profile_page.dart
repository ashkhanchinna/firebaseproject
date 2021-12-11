import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:matrimoney/controllers/auth_controllers/address_form_controller/adress_form_controll.dart';
import 'package:matrimoney/controllers/auth_controllers/picture_form_controller/picture_form_controller.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_form_controll.dart';
import 'package:matrimoney/controllers/profile_page_controller/profile_page_controller.dart';
import 'package:matrimoney/views/authentication/auth_widgets/button_widget.dart';
import 'package:matrimoney/views/authentication/auth_widgets/textfield.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  ProfilePageController controller = Get.put(ProfilePageController());
  SignupFormValidateController controll =
      Get.put(SignupFormValidateController(), tag: "signup");
  AddressFormController address =
      Get.put(AddressFormController(), tag: "addresspage");
  PictureFormController picture =
      Get.put(PictureFormController(), tag: "picture");
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text("PROFILE PAGE"),
          actions: [
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  controller.edit.toggle();
                },
                icon: Icon(
                  Icons.edit,
                  color: controller.edit.value ? Colors.red : Colors.white,
                ))
          ],
        ),
        body: controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          // color: Colors.amber,
                          height: 130,
                          child: controller.imageedit.value
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey.shade500,
                                  backgroundImage: FileImage(
                                    File(picture.image.value),
                                  ),
                                  //NetworkImage(controller.user.value.imageUrl!),
                                  radius: 60,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 25,
                                        right: 20,
                                        child: InkWell(
                                          onTap: () {
                                            picture.pickimage();
                                          },
                                          child: const CircleAvatar(
                                            radius: 23,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.orange,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    // picture.pickimage();
                                    // controller.imageedit.value = true;
                                  },
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                        controller.user.value.imageUrl!),
                                  ))),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        validator: controll.firstNameValidate,
                        hight: 15,
                        padding: 20,
                        label: "FirstName",
                        controller: controll.firstName,
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        controller: controll.lastName,
                        validator: controll.lastNameValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "LastName",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        controller: controll.userName,
                        validator: controll.userNameValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "UserNmae",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        type: TextInputType.emailAddress,
                        controller: controll.email,
                        validator: controll.emailValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "email",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        lenth: 10,
                        type: TextInputType.phone,
                        controller: controll.phoneNumber,
                        validator: controll.phoneNumberValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "phoneNumer",
                      ),
                      //****************************************address****** */
                      TextFeildWidget(
                        enable: controller.edit.value,
                        minline: 4,
                        maxline: 5,
                        type: TextInputType.multiline,
                        controller: address.address,
                        validator: address.addressValidate,
                        hight: h / 6,
                        padding: w / 20,
                        label: "address",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        controller: address.state,
                        validator: address.stateValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "state",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        controller: address.city,
                        validator: address.cityValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "city",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      TextFeildWidget(
                        enable: controller.edit.value,
                        type: TextInputType.number,
                        controller: address.pincode,
                        validator: address.pincodeValidate,
                        hight: h / 15,
                        padding: w / 20,
                        label: "pincode",
                      ),
                      SizedBox(
                        height: h / 45,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFeildWidget(
                              enable: controller.edit.value,
                              lenth: 2,
                              contentPadding: 0,
                              type: TextInputType.number,
                              controller: address.date,
                              validator: address.datevalidate,
                              hight: h / 15,
                              padding: 10,
                              label: "dd",
                            ),
                          ),
                          Expanded(
                            child: TextFeildWidget(
                              enable: controller.edit.value,
                              lenth: 2,
                              contentPadding: 0,
                              type: TextInputType.number,
                              controller: address.month,
                              validator: address.monthvalidate,
                              hight: h / 15,
                              padding: 10,
                              label: "mm",
                            ),
                          ),
                          Expanded(
                            child: TextFeildWidget(
                              enable: controller.edit.value,
                              lenth: 4,
                              contentPadding: 0,
                              type: TextInputType.number,
                              controller: address.year,
                              validator: address.yearValidate,
                              hight: h / 15,
                              padding: 10,
                              label: "yyyy",
                            ),
                          ),
                        ],
                      ),
                      //*****************************update */
                      SizedBox(height: h / 40),
                      TextFeildWidget(
                          enable: controller.edit.value,
                          controller: picture.optional,
                          validator: (value) {},
                          hight: h / 6,
                          padding: w / 25,
                          label: "write some thing"),
                      SizedBox(height: h / 40),
                      controller.edit.value
                          ? buttonWidget(
                              name: "update",
                              margin: w / 10,
                              hight: h / 15,
                              action: () {
                                if (key.currentState!.validate()) {
                                  controller.updatefunction();
                                }
                              })
                          : SizedBox(
                              height: 20,
                            ),
                      SizedBox(height: h / 40),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}

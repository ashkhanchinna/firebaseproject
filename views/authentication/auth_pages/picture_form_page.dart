import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:matrimoney/controllers/auth_controllers/picture_form_controller/picture_form_controller.dart';
import 'package:matrimoney/views/authentication/auth_widgets/button_widget.dart';
import 'package:matrimoney/views/authentication/auth_widgets/textfield.dart';

class PictureFormPage extends StatefulWidget {
  const PictureFormPage({Key? key}) : super(key: key);

  @override
  State<PictureFormPage> createState() => _PictureFormPageState();
}

class _PictureFormPageState extends State<PictureFormPage> {
  PictureFormController controll =
      Get.put(PictureFormController(), tag: "picture");
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(body: Obx(() {
      return controll.loading.value? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h / 5.5),
            SizedBox(
              height: h / 4.5,
              width: w,
              child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.grey.shade500,
                    backgroundImage: controll.image.value == ""
                        ? null
                        : FileImage(
                            File(controll.image.value),
                          ),
                    radius: 60,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 25,
                          right: 100,
                          child: InkWell(
                            onTap: () {
                              controll.pickimage();
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
                  )),
            ),
            SizedBox(height: h / 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 25),
              child: const Text("(optional)"),
            ),
            SizedBox(height: h / 40),
            TextFeildWidget(
                controller: controll.optional,
                validator: (value) {},
                hight: h / 6,
                padding: w / 25,
                label: "write some thing"),
            SizedBox(height: h / 40),
            buttonWidget(
                name: "finish",
                margin: w / 10,
                hight: h / 15,
                action: () {
                  controll.uploadImage();
                }),
          ],
        ),
      );
    }));
  }
}

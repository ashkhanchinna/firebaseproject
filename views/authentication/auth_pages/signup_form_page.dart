import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_database_controller.dart';
import 'package:matrimoney/controllers/auth_controllers/signup_form_controller/signup_form_controll.dart';
import 'package:matrimoney/views/authentication/auth_pages/signin_form_page.dart';
import 'package:matrimoney/views/authentication/auth_widgets/button_widget.dart';
import 'package:matrimoney/views/authentication/auth_widgets/textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupFormValidateController controll =
      Get.put(SignupFormValidateController(), tag: "signup");
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  SignupDatabaseController dbControll = Get.put(SignupDatabaseController(),tag: "signupdata");

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: signupFormKey,
          child: Column(
            children: [
              SizedBox(
                height: h / 5.5,
              ),
              TextFeildWidget(
                validator: controll.firstNameValidate,
                hight: h / 15,
                padding: w / 20,
                label: "FirstName",
                controller: controll.firstName,
              ),
              SizedBox(
                height: h / 45,
              ),
              TextFeildWidget(
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
                lenth: 10,
                type: TextInputType.phone,
                controller: controll.phoneNumber,
                validator: controll.phoneNumberValidate,
                hight: h / 15,
                padding: w / 20,
                label: "phoneNumer",
              ),
              SizedBox(
                height: h / 45,
              ),
              Obx(() => TextFeildWidget(
                    obscure: controll.obscuretext.value,
                    icon: true,
                    sufficons: IconButton(
                        splashRadius: 10,
                        onPressed: () {
                          controll.passwordeye();
                        },
                        icon: Icon(
                          controll.obscuretext.value
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: controll.obscuretext.value
                              ? Colors.red
                              : Colors.black,
                        )),
                    type: TextInputType.visiblePassword,
                    controller: controll.password,
                    validator: controll.passwordvalidate,
                    hight: h / 15,
                    padding: w / 20,
                    label: "password",
                  )),
              SizedBox(
                height: h / 45,
              ),
              buttonWidget(
                  name: "SignUp",
                  margin: w / 10,
                  hight: h / 15,
                  action: () {
                    //Get.to(() => AddressFormPage());
                    if (signupFormKey.currentState!.validate()) {
                      dbControll.signin();
                    }
                  }),
              SizedBox(
                height: h / 45,
              ),
              buttonWidget(
                  name: "Go to login",
                  margin: w / 10,
                  hight: h / 15,
                  action: () {
                    Get.to(() => const SigninFormPage());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

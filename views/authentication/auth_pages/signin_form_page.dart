import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:matrimoney/controllers/auth_controllers/signin_form_controller.dart';
import 'package:matrimoney/views/authentication/auth_pages/signup_form_page.dart';
import 'package:matrimoney/views/authentication/auth_widgets/button_widget.dart';
import 'package:matrimoney/views/authentication/auth_widgets/textfield.dart';

class SigninFormPage extends StatefulWidget {
  const SigninFormPage({Key? key}) : super(key: key);

  @override
  _SigninFormPageState createState() => _SigninFormPageState();
}

class _SigninFormPageState extends State<SigninFormPage> {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  SigninFormController controll = Get.put(SigninFormController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: signinFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h / 5.5,
              ),
              TextFeildWidget(
                validator: controll.emailValidation,
                hight: h / 15,
                padding: w / 20,
                label: "email",
                controller: controll.loginemail,
              ),
              SizedBox(
                height: h / 45,
              ),
              TextFeildWidget(
                controller: controll.loginPassword,
                validator: controll.passwordvalidation,
                hight: h / 15,
                padding: w / 20,
                label: "password",
              ),
              SizedBox(
                height: h / 45,
              ),
              buttonWidget(
                  name: "login",
                  margin: w / 10,
                  hight: h / 15,
                  action: () {
                    if (signinFormKey.currentState!.validate()) {
                      controll.login();
                    }
                    //Get.to(() => AddressFormPage());
                  }),
              SizedBox(
                height: h / 45,
              ),
              buttonWidget(
                  name: "crate account",
                  margin: w / 10,
                  hight: h / 15,
                  action: () {
                    Get.to(() => SignupPage());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:matrimoney/controllers/auth_controllers/address_form_controller/address_database_controller.dart';
import 'package:matrimoney/controllers/auth_controllers/address_form_controller/adress_form_controll.dart';
import 'package:matrimoney/views/authentication/auth_widgets/button_widget.dart';
import 'package:matrimoney/views/authentication/auth_widgets/textfield.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({Key? key}) : super(key: key);

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  AddressFormController controll =
      Get.put(AddressFormController(), tag: "addresspage");
  AddressDatabaseController dbControll =
      Get.put(AddressDatabaseController(), tag: "address");
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return dbControll.loading.value? Center(child: CircularProgressIndicator()): SingleChildScrollView(
            child: Form(
              key: addressFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: h / 5.5,
                  ),
                  TextFeildWidget(
                    minline: 4,
                    maxline: 5,
                    type: TextInputType.multiline,
                    controller: controll.address,
                    validator: controll.addressValidate,
                    hight: h / 6,
                    padding: w / 20,
                    label: "address",
                  ),
                  SizedBox(
                    height: h / 45,
                  ),
                  TextFeildWidget(
                    controller: controll.state,
                    validator: controll.stateValidate,
                    hight: h / 15,
                    padding: w / 20,
                    label: "state",
                  ),
                  SizedBox(
                    height: h / 45,
                  ),
                  TextFeildWidget(
                    controller: controll.city,
                    validator: controll.cityValidate,
                    hight: h / 15,
                    padding: w / 20,
                    label: "city",
                  ),
                  SizedBox(
                    height: h / 45,
                  ),
                  TextFeildWidget(
                    type: TextInputType.number,
                    controller: controll.pincode,
                    validator: controll.pincodeValidate,
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
                          lenth: 2,
                          contentPadding: 0,
                          type: TextInputType.number,
                          controller: controll.date,
                          validator: controll.datevalidate,
                          hight: h / 15,
                          padding: 10,
                          label: "dd",
                        ),
                      ),
                      Expanded(
                        child: TextFeildWidget(
                          lenth: 2,
                          contentPadding: 0,
                          type: TextInputType.number,
                          controller: controll.month,
                          validator: controll.monthvalidate,
                          hight: h / 15,
                          padding: 10,
                          label: "mm",
                        ),
                      ),
                      Expanded(
                        child: TextFeildWidget(
                          lenth: 4,
                          contentPadding: 0,
                          type: TextInputType.number,
                          controller: controll.year,
                          validator: controll.yearValidate,
                          hight: h / 15,
                          padding: 10,
                          label: "yyyy",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 35,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Obx(() => Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Expanded(
                  //             child: DropdownButton<String>(
                  //               hint: Text("date"),
                  //               items: dates.map((String value) {
                  //                 return DropdownMenuItem<String>(
                  //                  // value: value,
                  //                   child: Text(value),
                  //                 );
                  //               }).toList(),
                  //              // onChanged: (value) {},
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: DropdownButton<String>(
                  //               value: controll.monthValue.value,
                  //               hint: Text(" month"),
                  //               items: months.map((String value) {
                  //                 return DropdownMenuItem<String>(
                  //                   value: value,
                  //                   child: Text(value),
                  //                 );
                  //               }).toList(),
                  //               onChanged: controll.getmonth,
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(bottom: 15.0),
                  //               child: TextFormField(),
                  //             ),
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  buttonWidget(
                      name: "Next",
                      margin: w / 10,
                      hight: h / 15,
                      action: () {
                        //  Get.to(() => const PictureFormPage());
                        if (addressFormKey.currentState!.validate()) {
                          dbControll.postAddress();
                        }
                      }),
                ],
              ),
            ),
          );
        }));
  }
}

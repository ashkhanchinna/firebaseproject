import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFeildWidget extends StatelessWidget {
  final double hight;
  final double padding;
  final String label;
  TextEditingController controller;
  String? Function(String? value) validator;
  int? lenth = 40;
  bool icon = false;
  Widget? sufficons;
  bool obscure;
  int maxline;
  int minline;
  double contentPadding;
  bool enable = true;

  //final TextEditingController controller;
  TextInputType? type = TextInputType.streetAddress;

  TextFeildWidget(
      {Key? key,
      required this.hight,
      required this.padding,
      required this.label,
      required this.controller,
      required this.validator,
      this.lenth,
      this.icon = false,
      this.sufficons,
      this.obscure = false,
      this.maxline = 1,
      this.minline = 1,
      this.contentPadding = 10,
      this.type,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        enabled: enable,
        obscureText: obscure,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        validator: validator,
        controller: controller,
        maxLength: lenth,
        maxLines: maxline,
        minLines: minline,
        keyboardType: type,
        decoration: InputDecoration(
          suffixIcon: icon
              ? sufficons
              : const SizedBox(
                  width: 0.01,
                  height: 0.01,
                ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: contentPadding,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          // hintText: "Enter Your Name",
          label: Text(
            label,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget buttonWidget(
    {required String name,
    required double margin,
    required double hight,
    required void Function() action}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    height: hight,
    decoration: BoxDecoration(
        color: Colors.orange, borderRadius: BorderRadius.circular(30)),
    child: ElevatedButton(
      onPressed: action,
      child: Text(name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
    ),
  );
}

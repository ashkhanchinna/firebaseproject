import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimoney/views/authentication/auth_pages/auth_checking_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home:AuthChecking(),
    );
  }
}

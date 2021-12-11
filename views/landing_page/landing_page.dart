import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:matrimoney/controllers/profile_page_controller/profile_page_controller.dart';

import 'package:matrimoney/views/home/home_page.dart';
import 'package:matrimoney/views/profile_page/profile_page.dart';

class LandingPgae extends StatefulWidget {
  LandingPgae({Key? key}) : super(key: key);

  @override
  State<LandingPgae> createState() => _LandingPgaeState();
}

class _LandingPgaeState extends State<LandingPgae> {
  
 
  List<Widget> pages = [
    const HomePage(),
     ProfilePage(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: index,
          items: [
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text("home")),
            BottomNavyBarItem(icon: Icon(Icons.person), title: Text("profile"))
          ],
          onItemSelected: (index) {
            setState(() {
              this.index = index;
            });
          }),
    );
  }
}

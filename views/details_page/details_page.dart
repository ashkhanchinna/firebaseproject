import 'package:flutter/material.dart';
import 'package:matrimoney/models/user_details/user_details.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.user}) : super(key: key);
  final UserSignupDetails user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail page"),
      ),
      body: ListView(
        //  padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
              height: 200,
              // color: Colors.amber,
              //  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: user.imageUrl == null || user.imageUrl == ""
                  ? Icon(
                      Icons.person,
                      size: 100,
                    )
                  : Image(
                      image: NetworkImage(user.imageUrl!),
                      fit: BoxFit.cover,
                    )),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "firstName :  ${user.firstName}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "lastName :  ${user.lastName}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PhoneNumber :  ${user.phoneNumber}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "email :  ${user.email}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Address :  ${user.address}",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "city :  ${user.city}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "DOB :  ${user.dateOfBirth}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "state :  ${user.state}",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

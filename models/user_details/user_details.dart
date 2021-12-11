class UserSignupDetails {
  String? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? password;
  String? email;
  String? phoneNumber;
  String? address;
  String? state;

  String? pincode;
  String? city;
  String? dateOfBirth;

   String? imageUrl;
  String? about;

  UserSignupDetails({
    this.id,
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.password = "",
    this.phoneNumber = "",
    this.userName = "",
    this.pincode = "",
    this.state  = "",
    this.address  = "",
    this.city  = "",
    this.dateOfBirth  = "",
    this.about = "", 
    this.imageUrl = ""
    
  });

  factory UserSignupDetails.fromjson(Map<String, dynamic> json) {
    return UserSignupDetails(
      id: json["id"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      phoneNumber: json["phoneNumber"],
      userName: json["userName"],
      address: json["address"],
      city: json["city"],
      dateOfBirth: json["dob"],
      pincode: json["pincode"],
      state: json["state"],
       about: json["about"],
      imageUrl: json["imageUrl"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "userName": userName,
      "address": address,
      "city": city,
      "dob": dateOfBirth,
      "pincode": pincode,
      "state": state,
       "about": about,
          "imageUrl": imageUrl,
    };
  }
}

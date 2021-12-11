

class UserAddressDetails {
  String? address;
  String? state;

  String? pincode;
  String? city;
  String? dateOfBirth;
  UserAddressDetails({
    this.pincode = "",
    this.state = "",
    this.address = "",
    this.city = "",
    this.dateOfBirth = "",
  });

   UserAddressDetails.fromjson(  Map<String,dynamic>json) {
    UserAddressDetails(
      address: json["address"],
      city: json["city"],
      dateOfBirth: json["dob"],
      pincode: json["pincode"],
      state: json["state"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "address": address,
      "city": city,
      "dob": dateOfBirth,
      "pincode": pincode,
      "state": state,
    };
  }
}

List<String> dates = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
  "31"
];

List<String> months = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
];

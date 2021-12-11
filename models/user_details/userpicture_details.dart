class UserPicturDetails {
  String? imageUrl;
  String? about;
  UserPicturDetails({this.about, this.imageUrl});
  UserPicturDetails.fromjson(Map<String, dynamic> json) {
    UserPicturDetails(
      about: json["about"],
      imageUrl: json["imageUrl"],
    );

   
  }


 Map<String, dynamic> tojson() => {
          "about": about,
          "imageUrl": imageUrl,
        };

}

import 'package:peerconnect_flutter/models/User.dart';

class EditProfileModel {
  
  String firstName;
  String lastName;
  String email;
  String college;
  String major;
  // String profilePicture;
  // String coverPicture;

  EditProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.college,
    required this.major,
    // required this.profilePicture,
    // required this.coverPicture
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'college': college,
    'major': major,
  };

  EditProfileModel.empty()
        : firstName = "",
          lastName = "",
          email = "",
          college = "",
          major = "";

  EditProfileModel.adapt(User user)
      : firstName = user.firstName,
        lastName = user.lastName,
        email = user.email,
        college = user.college,
        major = user.major;
        // profilePicture = user.profilePicture as String,
        // coverPicture = user.coverPicture as String;
}
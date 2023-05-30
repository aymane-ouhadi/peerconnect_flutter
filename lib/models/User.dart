import 'package:peerconnect_flutter/models/EditProfileModel.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  bool isConfirmed;
  String college;
  String major;
  String password;
  String? profilePicture;
  String? coverPicture;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isConfirmed,
    required this.college,
    required this.major,
    required this.password,
    this.profilePicture,
    this.coverPicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      isConfirmed: json['isConfirmed'] ?? false,
      college: json['college'],
      major: json['major'],
      password: json['password'],
      profilePicture: json['profilePicture'],
      coverPicture: json['coverPicture'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'isConfirmed': isConfirmed,
    'college': college,
    'major': major,
    'password': password,
    'profilePicture': profilePicture,
    'coverPicture': coverPicture,
  };

  factory User.empty() {
    return User(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      isConfirmed: false,
      college: '',
      major: '',
      password: '',
      profilePicture: '',
      coverPicture: '',
    );
  }

  factory User.adapt(User user, EditProfileModel editProfileModel) {

    return User(
      id: user.id,
      firstName: editProfileModel.firstName,
      lastName: editProfileModel.lastName,
      email: editProfileModel.email,
      isConfirmed: user.isConfirmed,
      college: editProfileModel.college,
      major: editProfileModel.major,
      password: user.password,
      profilePicture: user.profilePicture,
      coverPicture: user.coverPicture,
    );

    // return 
    // user.firstName = editProfileModel.firstName;
    // user.lastName = editProfileModel.lastName;
    // user.email = editProfileModel.email;
    // user.college = editProfileModel.college;
    // user.major = editProfileModel.major;
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, email: $lastName}, profilePicture: ${profilePicture}';
    return 'User{id: $id, firstName: $firstName, email: $lastName}, profilePicture: ${profilePicture}';
  }
  
}

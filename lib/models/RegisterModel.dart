class RegisterModel {

  String firstName;
  String lastName;
  String email;
  String college;
  String major;
  String password;
  String confirmPassword;
  String profilePicture;
  String coverPicture;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.college,
    required this.major,
    required this.password,
    required this.confirmPassword,
    required this.profilePicture,
    required this.coverPicture
  });

  RegisterModel.empty()
      : firstName = "",
        lastName = "",
        email = "",
        college = "",
        major = "",
        password = "",
        confirmPassword = "",
        profilePicture = "",
        coverPicture = "";
}

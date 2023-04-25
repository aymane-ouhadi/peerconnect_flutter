class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  LoginModel.empty()
      : email = '',
        password = '';
}

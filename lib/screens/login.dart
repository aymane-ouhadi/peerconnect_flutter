import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/LoginModel.dart';
import 'package:peerconnect_flutter/screens/register.dart';
import 'package:peerconnect_flutter/widgets/auth_header.dart';
import 'package:peerconnect_flutter/widgets/bottom_action.dart';
import 'package:peerconnect_flutter/widgets/password_input.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';

import 'package:peerconnect_flutter/utils/my_colors.dart';

class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginModel loginModel = LoginModel.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AuthHeader(
                header: "Hello Again",
                subText: "Welcome back, you've been missed!"
              ),
              const SizedBox(height: 100),
              TextInput(
                hintText: "Email",
                value: loginModel.email,
                onChanged: (value) {
                  loginModel.email = value;
                },
              ),
              const SizedBox(height: 40),
              PasswordInput(
                hintText: "Password",
                value: loginModel.email,
                onChanged: (value) {
                  loginModel.password = value;
                },
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  minimumSize: const Size(double.infinity, 0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: MyColors.primaryColor
                ),
                child: const Text("Sign In"),
                onPressed: (){
                  // print("Email : ${loginModel.email}");
                  // print("Password : ${loginModel.password}");
                }, 
              ),
              BottomAction(
                question: "Not a member",
                action: {"Register Now": Register()},
              )
            ],
          ),
        ),
      ),
    );

  }
}
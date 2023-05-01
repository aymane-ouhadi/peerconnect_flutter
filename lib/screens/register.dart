import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/RegisterModel.dart';
import 'package:peerconnect_flutter/screens/login.dart';
import 'package:peerconnect_flutter/widgets/auth_header.dart';
import 'package:peerconnect_flutter/widgets/bottom_action.dart';
import 'package:peerconnect_flutter/widgets/image_input.dart';
import 'package:peerconnect_flutter/widgets/password_input.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';

import 'package:peerconnect_flutter/utils/my_colors.dart';

class Register extends StatefulWidget {

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterModel registerModel = RegisterModel.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AuthHeader(
                header: "Welcome Aboard",
                subText: "Find your college clique using Peer Connect"
              ),
              const SizedBox(height: 100),
              TextInput(
                hintText: "First Name",
                value: registerModel.firstName,
                onChanged: (value) {
                  registerModel.firstName = value;
                },
              ),
              const SizedBox(height: 40),
              TextInput(
                hintText: "Last Name",
                value: registerModel.lastName,
                onChanged: (value) {
                  registerModel.lastName = value;
                },
              ),
              const SizedBox(height: 40),
              TextInput(
                hintText: "Email",
                value: registerModel.email,
                onChanged: (value) {
                  registerModel.email = value;
                },
              ),
              const SizedBox(height: 40),
              TextInput(
                hintText: "College",
                value: registerModel.college,
                onChanged: (value) {
                  registerModel.college = value;
                },
              ),
              const SizedBox(height: 40),
              TextInput(
                hintText: "Major",
                value: registerModel.major,
                onChanged: (value) {
                  registerModel.major = value;
                },
              ),
              const SizedBox(height: 40),
              ImageInput(hintText: "Profile Picture"),
              const SizedBox(height: 40),
              ImageInput(hintText: "Cover Picture"),
              const SizedBox(height: 40),
              PasswordInput(
                hintText: "Password",
                value: registerModel.email,
                onChanged: (value) {
                  registerModel.password = value;
                },
              ),
              const SizedBox(height: 40),
              PasswordInput(
                hintText: "Confirm Password",
                value: registerModel.confirmPassword,
                onChanged: (value) {
                  registerModel.confirmPassword = value;
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
                child: const Text("Sign Up"),
                onPressed: (){
                  // print("Data : $registerModel");
                }, 
              ),
              BottomAction(
                question: "Already a member?",
                action: {"Login": Login()},
              )
            ],
          ),
        ),
      ),
    );

  }
}
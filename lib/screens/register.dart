import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerconnect_flutter/models/RegisterModel.dart';
import 'package:peerconnect_flutter/screens/login.dart';
import 'package:peerconnect_flutter/services/AuthenticationService.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
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

  bool isFetching = false;

  XFile? profile;

  XFile? cover;

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
              ImageInput(
                hintText: "Profile Picture", 
                onChanged: (XFile file){  
                  profile = file;
                  print("profile : ${profile?.name}");
                },),
              const SizedBox(height: 40),
              ImageInput(
                hintText: "Cover Picture",
                onChanged: (XFile? file){
                  cover = file;
                  print("cover : ${cover?.name}");
                },
              ),
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
                  backgroundColor: MyColors.primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text(isFetching ? "Processing..." : "Sign Up"),
                onPressed: () async {

                  //Alerting the user that signing up is being done
                  setState(() {
                    isFetching = true;
                  });

                  //Saving the profile picture
                  String profilePath = await ComfortService.saveFile(
                    profile,
                    Constants.uploadedProfilesBase
                  );

                  //Saving the cover picture
                  String coverPath = await ComfortService.saveFile(
                    cover,
                    Constants.uploadedCoversBase
                  );

                  setState(() {
                    registerModel.profilePicture = profilePath;
                    registerModel.coverPicture = coverPath;
                  });

                  print("Data : ${registerModel}");
                  AuthenticationService.register(registerModel).then((value) {
                    setState(() {
                      isFetching = false;
                    });
                    if(value.statusCode < 400){
                      print("register status: $value");
                      Navigator.pushNamed(context, "/login");
                    }
                    else{
                      Fluttertoast.showToast(
                        msg: value.body,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: MyColors.toastColor,
                        timeInSecForIosWeb: 1,
                      );

                    }
                  });

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
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peerconnect_flutter/models/LoginModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/screens/register.dart';
import 'package:peerconnect_flutter/services/AuthenticationService.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:peerconnect_flutter/widgets/auth_header.dart';
import 'package:peerconnect_flutter/widgets/bottom_action.dart';
import 'package:peerconnect_flutter/widgets/password_input.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';

import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginModel loginModel = LoginModel.empty();

  @override
  void initState() {
    super.initState();
    AuthenticationService.processJwt(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (BuildContext context, AuthProvider provider, Widget? widget) {
            return Padding(
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
                      backgroundColor: MyColors.primaryColor,
                      foregroundColor: Colors.white
                    ),
                    child: const Text("Sign In"),
                    onPressed: () async {

                      //Fetching the user
                      User? user = await AuthenticationService.fetchUser(loginModel.email, loginModel.password);

                      //Deniying permission in case of wrong credentials
                      if(user?.id == null){
                        Fluttertoast.showToast(
                          msg: "Email/Password is wrong",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: MyColors.toastColor,
                          timeInSecForIosWeb: 1,
                        );
                      }
                      else{
                        //Attaching authenticated user to the provider for gloabal access
                        provider.user = user ?? User.empty();

                        //Creating the Jwt
                        String jwt = AuthenticationService.generateJwt(user!.id);

                        //Storing the Jwt
                        AuthenticationService.storeJwt(Constants.jwtDisplayName, jwt);


                        Navigator.pushNamed(context, "/home");
                      }
                      
                    }, 
                  ),
                  BottomAction(
                    question: "Not a member",
                    action: {"Register Now": Register()},
                  )
                ],
              )
          );
          }
        )
      ),
    );

  }
}
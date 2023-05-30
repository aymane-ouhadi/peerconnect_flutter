import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerconnect_flutter/models/EditProfileModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/screens/login.dart';
import 'package:peerconnect_flutter/services/AuthenticationService.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/services/UserService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:peerconnect_flutter/widgets/auth_header.dart';
import 'package:peerconnect_flutter/widgets/bottom_action.dart';
import 'package:peerconnect_flutter/widgets/image_input.dart';
import 'package:peerconnect_flutter/widgets/password_input.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {

  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  EditProfileModel editProfileModel = EditProfileModel.empty();

  bool isFetching = false;

  XFile? profile;

  XFile? cover;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      editProfileModel = ModalRoute.of(context)!.settings.arguments as EditProfileModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBar(isRoot: false),
                const SizedBox(height: 50),
                TextInput(
                  hintText: "First Name",
                  value: editProfileModel.firstName,
                  onChanged: (value) {
                    editProfileModel.firstName = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Last Name",
                  value: editProfileModel.lastName,
                  onChanged: (value) {
                    editProfileModel.lastName = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Email",
                  value: editProfileModel.email,
                  onChanged: (value) {
                    editProfileModel.email = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "College",
                  value: editProfileModel.college,
                  onChanged: (value) {
                    editProfileModel.college = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Major",
                  value: editProfileModel.major,
                  onChanged: (value) {
                    editProfileModel.major = value;
                  },
                ),
                // const SizedBox(height: 40),
                // ImageInput(
                //   hintText: "Profile Picture", 
                //   onChanged: (XFile file){  
                //     profile = file;
                //     print("profile : ${profile?.name}");
                //   },),
                // const SizedBox(height: 40),
                // ImageInput(
                //   hintText: "Cover Picture",
                //   onChanged: (XFile? file){
                //     cover = file;
                //     print("cover : ${cover?.name}");
                //   },
                // ),
                // const SizedBox(height: 40),
                // PasswordInput(
                //   hintText: "Password",
                //   value: editProfileModel.email,
                //   onChanged: (value) {
                //     editProfileModel.password = value;
                //   },
                // ),
                // const SizedBox(height: 40),
                // PasswordInput(
                //   hintText: "Confirm Password",
                //   value: editProfileModel.confirmPassword,
                //   onChanged: (value) {
                //     editProfileModel.confirmPassword = value;
                //   },
                // ),
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
                  child: Text(isFetching ? "Saving..." : "Save"),
                  onPressed: () async {
      
                    //Alerting the user that signing up is being done
                    setState(() {
                      isFetching = true;
                    });
      
                    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
      
                    // //Saving the profile picture
                    // String profilePath = await ComfortService.saveFile(
                    //   profile,
                    //   Constants.uploadedProfilesBase
                    // );
      
                    // //Saving the cover picture
                    // String coverPath = await ComfortService.saveFile(
                    //   cover,
                    //   Constants.uploadedCoversBase
                    // );
      
                    // setState(() {
                    //   editProfileModel.profilePicture = profilePath;
                    //   editProfileModel.coverPicture = coverPath;
                    // });
      
                    print("Data : ${editProfileModel}");
                    UserService.editUser(
                      authProvider.user.id, 
                      editProfileModel
                    ).then((value) {
                      setState(() {
                        isFetching = false;
                      });
      
                      //Updating the user in the context
                      authProvider.user = User.adapt(authProvider.user, editProfileModel);
      
                      if(value.statusCode < 400){
                        print("register status: $value");
                        Navigator.pushNamed(context, "/home");
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
      ),
    );

  }
}